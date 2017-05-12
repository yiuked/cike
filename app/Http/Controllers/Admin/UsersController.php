<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\User;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\URL;

class UsersController extends Controller
{
    public function index()
    {
        $users = User::paginate(15);
        return view('admin.users.index', ['users' => $users]);
    }

    public function profile($id)
    {
        $user = User::find($id);
        return view('admin.users.profile', ['user' => $user]);
    }

    public function update(Request $request, $id) {
        if ($request->method() == 'GET') {
            $user = User::find($id);
            return view('admin.users.update', ['user' => $user]);
        } elseif ($request->method() == 'POST') {
            $user = User::find($request->input('id'));
            $user->name = $request->input('name');
            if (!empty($request->input('password'))) {
                $user->password = bcrypt($request->input('password'));
            }
            if ($user->save()) {
                return redirect(admin_url('users'));
            }
        }
    }

    public function delete($id)
    {
        $user = User::find($id);
        $user->delete();
        return redirect(Url('/user/users'));
    }


}
