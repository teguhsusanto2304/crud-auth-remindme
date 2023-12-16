<?php

namespace App\Http\Controllers;

use App\Models\Reminder;
use Illuminate\Http\Request;
use Laravel\Sanctum\PersonalAccessToken;
use Illuminate\Http\JsonResponse;
use App\Http\Controllers\BaseController as BaseController;
use App\Http\Resources\ReminderResource;
use Validator;

const ERR_INVALID_ACCESS_TOKEN = 'ERR_INVALID_ACCESS_TOKEN';
const ERR_FORBIDDEN_ACCESS = 'ERR_FORBIDDEN_ACCESS';
const ERR_REQUIRED = 'ERR_REQUIRED';
const ERR_NOT_FOUND = 'ERR_NOT_FOUND';
const ERR_INTERNAL_ERROR = "ERR_INTERNAL_ERROR";
class ReminderController extends BaseController
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): JsonResponse
    {
        if (!empty($request->header('Authorization'))) {
            $parts = explode(' ', $request->header('Authorization'));

            if (count($parts) !== 2 || strtolower($parts[0]) !== 'bearer') {
                return $this->sendError(ERR_INVALID_ACCESS_TOKEN, "invalid access token", 401);
            }
            $refreshToken = $parts[1];
        } else {
            return $this->sendError(ERR_INVALID_ACCESS_TOKEN, "invalid access token", 401);
        }
        try {
            $token = PersonalAccessToken::findToken($refreshToken);
            if (empty($token)) {
                return $this->sendError(ERR_FORBIDDEN_ACCESS, "user doesn't have enough authorization", 403);
            } else {

                $limit = $request->query('limit', 10); // Get limit from query string
                $reminder = Reminder::query()->limit($limit)->get();
                return $this->sendResponse(['reminders' => ReminderResource::collection($reminder)], $limit, 200);

            }
        } catch (\Illuminate\Database\QueryException $exception) {
            return $this->sendError(ERR_INTERNAL_ERROR, "unable to connect into database", 500);
        }

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request): JsonResponse
    {
        if (!empty($request->header('Authorization'))) {
            $parts = explode(' ', $request->header('Authorization'));

            if (count($parts) !== 2 || strtolower($parts[0]) !== 'bearer') {
                return $this->sendError(ERR_INVALID_ACCESS_TOKEN, "invalid access token", 401);
            }
            $refreshToken = $parts[1];
        } else {
            return $this->sendError(ERR_INVALID_ACCESS_TOKEN, "invalid access token", 401);
        }
        try {
            $token = PersonalAccessToken::findToken($refreshToken);
            if (empty($token)) {
                return $this->sendError(ERR_FORBIDDEN_ACCESS, "user doesn't have enough authorization", 403);
            } else {
                $validator = Validator::make($request->json()->all(), [
                    'title' => 'required',
                    'description' => 'required',
                    'remind_at' => 'required|integer',
                    'event_at' => 'required|integer',
                ]);

                if ($validator->fails()) {
                    return $this->sendError(ERR_REQUIRED, $validator->errors(), 401);
                }

                $reminder = Reminder::create([
                    'title' => $request->json('title'),
                    'description' => $request->json('description'),
                    'remind_at' => $request->json('remind_at'),
                    'event_at' => $request->json('event_at'),
                ]);

                return $this->sendResponse(new ReminderResource($reminder), 0, 201);
            }
        } catch (\Illuminate\Database\QueryException $exception) {
            return $this->sendError(ERR_INTERNAL_ERROR, "unable to connect into database", 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request, $id): JsonResponse
    {
        if (!empty($request->header('Authorization'))) {
            $parts = explode(' ', $request->header('Authorization'));

            if (count($parts) !== 2 || strtolower($parts[0]) !== 'bearer') {
                return $this->sendError(ERR_INVALID_ACCESS_TOKEN, "invalid access token", 401);
            }
            $refreshToken = $parts[1];
        } else {
            return $this->sendError(ERR_INVALID_ACCESS_TOKEN, "invalid access token", 401);
        }
        try {
            $token = PersonalAccessToken::findToken($refreshToken);
            if (empty($token)) {
                return $this->sendError(ERR_FORBIDDEN_ACCESS, "user doesn't have enough authorization", 403);
            } else {
                $reminder = Reminder::where('id', $id)->get();
                $reminder = Reminder::find($id);
                if ($reminder == null) {
                    return $this->sendError(ERR_NOT_FOUND, 'resource is not found', 404);
                } else {
                    return $this->sendResponse(ReminderResource::collection($reminder), 0, 200);
                }
            }
        } catch (\Illuminate\Database\QueryException $exception) {
            return $this->sendError(ERR_INTERNAL_ERROR, "unable to connect into database", 500);
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        if (!empty($request->header('Authorization'))) {
            $parts = explode(' ', $request->header('Authorization'));

            if (count($parts) !== 2 || strtolower($parts[0]) !== 'bearer') {
                return $this->sendError(ERR_INVALID_ACCESS_TOKEN, "invalid access token", 401);
            }
            $refreshToken = $parts[1];
        } else {
            return $this->sendError(ERR_INVALID_ACCESS_TOKEN, "invalid access token", 401);
        }
        try {
            $token = PersonalAccessToken::findToken($refreshToken);
            if (empty($token)) {
                return $this->sendError(ERR_FORBIDDEN_ACCESS, "user doesn't have enough authorization", 403);
            } else {
                $validator = Validator::make($request->json()->all(), [
                    'title' => 'required',
                    'description' => 'required',
                    'remind_at' => 'required|integer',
                    'event_at' => 'required|integer',
                ]);

                if ($validator->fails()) {
                    return $this->sendError(ERR_REQUIRED, $validator->errors(), 401);
                }

                $reminder = Reminder::find($id);
                if ($reminder == null) {
                    return $this->sendError(ERR_NOT_FOUND, 'resource is not found', 404);
                } else {
                    $reminder->title = $request->json('title');
                    $reminder->description = $request->json('description');
                    $reminder->remind_at = $request->json('remind_at');
                    $reminder->event_at = $request->json('event_at');
                    $reminder->save();
                    return $this->sendResponse(new ReminderResource($reminder), 0, 201);
                }

            }
        } catch (\Illuminate\Database\QueryException $exception) {
            return $this->sendError(ERR_INTERNAL_ERROR, "unable to connect into database", 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, $id)
    {
        if (!empty($request->header('Authorization'))) {
            $parts = explode(' ', $request->header('Authorization'));

            if (count($parts) !== 2 || strtolower($parts[0]) !== 'bearer') {
                return $this->sendError(ERR_INVALID_ACCESS_TOKEN, "invalid access token", 401);
            }
            $refreshToken = $parts[1];
        } else {
            return $this->sendError(ERR_INVALID_ACCESS_TOKEN, "invalid access token", 401);
        }
        try {
            $token = PersonalAccessToken::findToken($refreshToken);
            if (empty($token)) {
                return $this->sendError(ERR_FORBIDDEN_ACCESS, "user doesn't have enough authorization", 403);
            } else {

                $reminder = Reminder::find($id);
                if ($reminder == null) {
                    return $this->sendError(ERR_NOT_FOUND, 'resource is not found', 404);
                } else {
                    $reminder->delete();
                    return $this->sendResponse(new ReminderResource($reminder), 0, 201);
                }
            }
        } catch (\Illuminate\Database\QueryException $exception) {
            return $this->sendError(ERR_INTERNAL_ERROR, "unable to connect into database", 500);
        }
    }
}
