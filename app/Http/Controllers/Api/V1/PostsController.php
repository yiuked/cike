<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;

class PostsController extends Controller
{

    public function range() {
        return response()->json([
            'name' => 'Abigail',
            'state' => 'CA'
        ]);
    }

    public function add() {

    }

}
