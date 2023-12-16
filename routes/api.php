<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\Controller;
use App\Http\Controllers\ReminderController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::post('/session', [AuthController::class,'signin']);
Route::put('/session',[AuthController::class,'refresh']);
Route::get('/reminders',[ReminderController::class,'index']);
Route::get('/reminders/{id}',[ReminderController::class,'show']);
Route::put('/reminders/{id}',[ReminderController::class,'update']);
Route::delete('/reminders/{id}',[ReminderController::class,'destroy']);
Route::post('/reminders',[ReminderController::class,'store']);
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('/refresh-token', function (Request $request) {
    $accessToken = $request->user()->createToken('access_token', [App\Enums\TokenAbility::ACCESS_API->value], config('sanctum.expiration'));

    return ['token' => $accessToken->plainTextToken];
})->middleware([
    'auth:sanctum',
    'ability:'.App\Enums\TokenAbility::ISSUE_ACCESS_TOKEN->value,
]);
