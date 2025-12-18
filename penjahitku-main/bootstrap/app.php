<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Session\TokenMismatchException;
// === TAMBAHKAN USE STATEMENT INI ===
use App\Http\Middleware\EnsureUserIsAdmin; 
// === AKHIR TAMBAHAN ===

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        // === TAMBAHKAN BARIS INI UNTUK ALIAS ===
        $middleware->alias([
            'admin' => EnsureUserIsAdmin::class, // 'admin' adalah nama aliasnya
        ]);
        // === AKHIR TAMBAHAN ===

        // Middleware lain mungkin sudah ada di sini, biarkan saja
        // $middleware->web(append: [ ... ]);
        // $middleware->api(prepend: [ ... ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        // Handle 419 CSRF Token Mismatch Error
        $exceptions->render(function (TokenMismatchException $e, $request) {
            if ($request->expectsJson()) {
                return response()->json([
                    'message' => 'CSRF token mismatch. Please refresh the page and try again.',
                    'error' => 'token_mismatch'
                ], 419);
            }

            // Untuk request biasa, redirect kembali dengan pesan error
            return redirect()->back()
                ->withInput($request->except('_token', '_method', 'password', 'password_confirmation'))
                ->with('error', 'Session expired. Silakan refresh halaman dan coba lagi.');
        });
    })->create();