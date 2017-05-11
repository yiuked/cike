<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\User;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\URL;

class UsersController extends Controller
{
    public function getIndex()
    {
        $users = User::paginate(15);
        return view('admin.users.index', ['users' => $users]);
    }

    public function getUpdate($id)
    {
        $user = User::find($id);
        return view('admin.users.update', ['user' => $user]);
    }

    public function postUpdate(Request $request) {
        $user = User::find($request->input('id'));
        $user->name = $request->input('name');
        if (!empty($request->input('password'))) {
            $user->password = bcrypt($request->input('password'));
        }
        if ($user->save()) {
            return redirect(Url('/user/users'));
        }
        
    }

    public function getDelete($id)
    {
        $user = User::find($id);
        $user->delete();
        return redirect(Url('/user/users'));
    }

    public function getView($id)
    {
        $user = User::find($id);
        return view('admin.users.view', ['user' => $user]);
    }
}
