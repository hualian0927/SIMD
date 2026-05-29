#pragma once

#include <cstddef>
#include <functional>
#include <pthread.h>
#include <queue>
#include <utility>
#include <vector>

class Workers {
public:
    struct Job {
        size_t start;
        size_t end;
        std::function<void(size_t, size_t)> fn;
    };

    explicit Workers(int nthreads) : active_count_(0), stop_(false) {
        if (nthreads < 1) nthreads = 1;
        pthread_mutex_init(&mutex_, nullptr);
        pthread_cond_init(&cond_, nullptr);
        pthread_cond_init(&done_cond_, nullptr);

        workers_.resize(static_cast<size_t>(nthreads));
        for (size_t i = 0; i < workers_.size(); ++i)
            pthread_create(&workers_[i], nullptr, &Workers::WorkerMain, this);
    }

    Workers(const Workers&) = delete;
    Workers& operator=(const Workers&) = delete;

    ~Workers() {
        pthread_mutex_lock(&mutex_);
        stop_ = true;
        pthread_cond_broadcast(&cond_);
        pthread_mutex_unlock(&mutex_);

        for (size_t i = 0; i < workers_.size(); ++i)
            pthread_join(workers_[i], nullptr);

        pthread_cond_destroy(&done_cond_);
        pthread_cond_destroy(&cond_);
        pthread_mutex_destroy(&mutex_);
    }

    void Enqueue(Job job) {
        pthread_mutex_lock(&mutex_);
        tasks_.push(std::move(job));
        ++active_count_;
        pthread_cond_signal(&cond_);
        pthread_mutex_unlock(&mutex_);
    }

    void WaitAll() {
        pthread_mutex_lock(&mutex_);
        while (active_count_ > 0 || !tasks_.empty())
            pthread_cond_wait(&done_cond_, &mutex_);
        pthread_mutex_unlock(&mutex_);
    }

private:
    static void* WorkerMain(void* arg) {
        static_cast<Workers*>(arg)->RunWorker();
        return nullptr;
    }

    void RunWorker() {
        while (true) {
            Job job;
            pthread_mutex_lock(&mutex_);
            while (tasks_.empty() && !stop_)
                pthread_cond_wait(&cond_, &mutex_);
            if (stop_ && tasks_.empty()) {
                pthread_mutex_unlock(&mutex_);
                break;
            }
            job = std::move(tasks_.front());
            tasks_.pop();
            pthread_mutex_unlock(&mutex_);

            job.fn(job.start, job.end);

            pthread_mutex_lock(&mutex_);
            --active_count_;
            if (active_count_ == 0 && tasks_.empty())
                pthread_cond_signal(&done_cond_);
            pthread_mutex_unlock(&mutex_);
        }
    }

    std::vector<pthread_t> workers_;
    std::queue<Job> tasks_;
    pthread_mutex_t mutex_;
    pthread_cond_t cond_;
    pthread_cond_t done_cond_;
    size_t active_count_;
    bool stop_;
};
