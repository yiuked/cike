<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel</title>

    <!-- Fonts -->
    <link href="//cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel='stylesheet' type='text/css'>

    <!-- Styles -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">
    {{-- <link href="{{ elixir('css/app.css') }}" rel="stylesheet"> --}}

    <style>
        body {
            font-family: 'Lato';
        }

        .fa-btn {
            margin-right: 6px;
        }
    </style>
</head>
<body id="app-layout">
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">

            <!-- Collapsed Hamburger -->
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#app-navbar-collapse">
                <span class="sr-only">Toggle Navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

            <!-- Branding Image -->
            <a class="navbar-brand" href="{{ url('/') }}">
                Laravel
            </a>
        </div>

        <div class="collapse navbar-collapse" id="app-navbar-collapse">
            <!-- Left Side Of Navbar -->
            <ul class="nav navbar-nav">
                <li><a href="{{ url('/home') }}">Home</a></li>
            </ul>

            <!-- Right Side Of Navbar -->
            <ul class="nav navbar-nav navbar-right">
                <!-- Authentication Links -->
                @if (Auth::guest())
                    <li><a href="{{ url('/login') }}">Login</a></li>
                    <li><a href="{{ url('/register') }}">Register</a></li>
                @else
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                            {{ Auth::user()->name }} <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu">
                            <li><a href="{{ url('/logout') }}"><i class="fa fa-btn fa-sign-out"></i>Logout</a></li>
                        </ul>
                    </li>
                @endif
            </ul>
        </div>
    </div>
</nav>
@if (!Auth::check())
    @yield('content')
@else
    <div class="row">
        <div class="col-md-2 left-menu">
            <div class="menu">
                <div class="menu-item">
                    <h4><a role="button" data-toggle="collapse" href="#collapseUser" aria-expanded="false"
                           aria-controls="collapseUser">
                            <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 用户管理
                        </a>
                    </h4>
                    <div class="collapse in" id="collapseUser">
                        <a href="{{admin_url('users')}}">用户列表</a>
                        <a href="">新增用户</a>
                        <a href="">用户统计</a>
                    </div>
                </div>
                <div class="menu-item">
                    <h4><a role="button" data-toggle="collapse" href="#collapseAmout" aria-expanded="false"
                           aria-controls="collapseAmout">
                            <span class="glyphicon glyphicon-euro" aria-hidden="true"></span> 资金管理
                        </a>
                    </h4>
                    <div class="collapse in" id="collapseAmout">
                        <a>充值记录</a>
                        <a>提现记录</a>
                    </div>
                </div>
                <div class="menu-item">
                    <h4><a role="button" data-toggle="collapse" href="#collapseSystem" aria-expanded="false"
                           aria-controls="collapseSystem">
                            <span class="glyphicon glyphicon-cog" aria-hidden="true"></span> 系统配置
                        </a>
                    </h4>
                    <div class="collapse in" id="collapseSystem">
                        <a>基础配置</a>
                        <a>系统配置</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-10 main-right">
            @yield('content')
        </div>
    </div>
@endif

<!-- JavaScripts -->
<script src="https://lib.sinaapp.com/js/jquery/2.2.4/jquery-2.2.4.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
{{-- <script src="{{ elixir('js/app.js') }}"></script> --}}
@yield('javascript')
</body>
</html>
