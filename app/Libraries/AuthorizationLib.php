<?php

namespace App\Libraries;

use \Firebase\JWT\JWT;

class AuthorizationLib
{
    function __construct()
    {
    }

    public function genToken($userDetails)
    {
        // echo 1; die;
        $key = getenv('JWT_SECRET');
        $iat = time(); // current timestamp value
        $exp = $iat + 3600;
 
        $payload = array(
            "iat" => $iat, //Time the JWT issued at
            "exp" => $exp, // Expiration time of token
            "data"      => array(
                "fname" => $userDetails[0]['fname'],
                "lname" => $userDetails[0]['lname'],
                "email" => $userDetails[0]['email_address']
            )
        );
         
        $token = JWT::encode($payload, $key, 'HS256');

        return $token;
    }
}
