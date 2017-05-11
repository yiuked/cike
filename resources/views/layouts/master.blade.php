<!-- Stored in resources/views/layouts/master.blade.php -->

<html>
<head>
    <title>App Name - @yield('title')</title>
    <link rel="stylesheet" href="{{asset('dist/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('dist/css/default.css')}}">
</head>
<body>
@section('sidebar')
    This is the master sidebar.
@show

<div class="container">
    @yield('content')
</div>
<script src="{{ asset('dist/js/jquery-3.1.1.min.js') }}"></script>
<script src="{{ asset('dist/js/bootstrap.min.js') }}" type="text/javascript"></script>
</body>
</html>
