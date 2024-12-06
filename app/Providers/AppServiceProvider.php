<?php

namespace App\Providers;

use App\Models\ActivityLog;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;
use Illuminate\Auth\Events\Login;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);

        Event::listen(function (Login $event) {
            ActivityLog::log("User {$event->user->name} logged in.");
        });

        if(\App::environment('production')) {
            \URL::forceScheme('https');
        }
    }
}
