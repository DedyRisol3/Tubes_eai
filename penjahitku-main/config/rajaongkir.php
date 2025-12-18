<?php

return [
    /*
    |--------------------------------------------------------------------------
    | RajaOngkir API Key
    |--------------------------------------------------------------------------
    |
    | Simpan API key di file .env dengan nama RAJAONGKIR_API_KEY
    |
    */
    'api_key' => env('RAJAONGKIR_API_KEY', ''),

    /*
    |--------------------------------------------------------------------------
    | RajaOngkir Base URL
    |--------------------------------------------------------------------------
    |
    | Default diset ke endpoint starter. Jika Anda menggunakan paket PRO,
    | ubah nilai RAJAONGKIR_BASE_URL di .env menjadi:
    | https://api.rajaongkir.com/pro
    |
    */
    'base_url' => env('RAJAONGKIR_BASE_URL', 'https://api.rajaongkir.com/starter'),
];