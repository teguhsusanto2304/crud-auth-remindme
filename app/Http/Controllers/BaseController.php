<?php


namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller as Controller;


class BaseController extends Controller
{
    /**
     * success response method.
     *
     * @return \Illuminate\Http\Response
     */
    public function sendResponse($result, $limit=10,$code)
    {
        if($limit>0){
            $response = [
                'ok' => true,
                'data'    => $result,
                'limit' => (int) $limit,
            ];
        } else {
            $response = [
                'ok' => true,
                'data'    => $result,            
            ];
        }
    	


        return response()->json($response, $code,['HTTP-Version'=> 'HTTP/1.1']);
    }


    /**
     * return error response.
     *
     * @return \Illuminate\Http\Response
     */
    public function sendError($err, $msg, $code = 404)
    {
    	$response = [
            'ok'=>false,
            'err' => $err,
            'msg' => $msg,
        ];


        if(!empty($errorMessages)){
            $response['data'] = $errorMessages;
        }


        return response()->json($response, $code,['HTTP-Version'=> 'HTTP/1.1']);
    }
}