<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Enums\TokenAbility;
use DateTimeImmutable;
use Auth;
use DateInterval;
use Laravel\Sanctum\PersonalAccessToken;
use App\Http\Controllers\BaseController;
const ERR_INVALID_REFRESH_TOKEN = 'ERR_INVALID_REFRESH_TOKEN';
const ERR_INVALID_CREDS = 'ERR_INVALID_CREDS';
class AuthController extends BaseController
{
    public function signin(Request $request)
    {
        $credentials = request()->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
        
        if (!auth()->attempt($credentials)) {
            return $this->sendError(ERR_INVALID_CREDS,"incorrect username or password",401); 
        }
        
        $user = auth()->user();
        $date = new DateTimeImmutable();
        $expiresAt = $date->add(new DateInterval('PT'.config('sanctum.expiration').'M'));
        $accessToken = $user->createToken('access_token', [TokenAbility::ACCESS_API->value],$expiresAt );
        $date = new DateTimeImmutable();
        $RTexpiresAt = $date->add(new DateInterval('PT'.config('sanctum.rt_expiration').'M'));
        $accessToken = $user->createToken('access_token', [TokenAbility::ACCESS_API->value],$expiresAt );
        $refreshToken = $user->createToken('refresh_token', [TokenAbility::ISSUE_ACCESS_TOKEN->value], $RTexpiresAt);
        return response()->json([
            'ok' => true,
            'data' => [
                'user' => [
                    'id' => $user->id,
                    'email' => $user->email,
                    'name' => $user->name,
                ],
                'token' => $accessToken->plainTextToken,
                'refresh_token' => $refreshToken->plainTextToken,
            ],
        ]);
    }
    public function refresh(Request $request)
    {
        if (!empty($request->header('Authorization'))) {
            $parts = explode(' ', $request->header('Authorization'));
    
            if (count($parts) !== 2 || strtolower($parts[0]) !== 'bearer') {
                return $this->sendError(ERR_INVALID_REFRESH_TOKEN,"invalid refresh token",401); 
            }
            $refreshToken = $parts[1];
        } else {
            return $this->sendError(ERR_INVALID_REFRESH_TOKEN,"invalid refresh token",401); 
        }
        $token = PersonalAccessToken::findToken($refreshToken);
        if(empty($token)){
            return $this->sendError(ERR_INVALID_REFRESH_TOKEN,"invalid refresh token",401); 
        } else {
            $user =  \App\Models\User::find($token->tokenable_id);
            $date = new DateTimeImmutable();
            $newDate = $date->add(new DateInterval('PT'.config('sanctum.expiration').'M'));
            $accessToken = $user->createToken('access_token', [TokenAbility::ACCESS_API->value],$newDate );
            
            return response()->json([
                'ok' => true,
                'data' => [
                    'access_token' => $accessToken->plainTextToken
                ],
            ]);
        }
        
    }
    public function logout()
    {
        Auth::user()->tokens()->delete();
        return response()->json([
            'message' => 'logout success'
        ]);
    }
}
