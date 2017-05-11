<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Request;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        if (Gate::denies('isHaveAccess', $request)) {
            abort(403);
        }
        return view('admin.home');
    }
}
