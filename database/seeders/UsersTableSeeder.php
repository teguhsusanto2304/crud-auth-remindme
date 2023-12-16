<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Hash;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name' => 'Alicia',
            'email' => 'alice@mail.com',
            'password' => Hash::make('123456'),
        ]);
        User::create([
            'name' => 'Bob',
            'email' => 'bob@mail.com',
            'password' => Hash::make('123456'),
        ]);
    }
}
