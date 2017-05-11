<!-- Stored in resources/views/layouts/master.blade.php -->

<html>
<head>
    <title>@yield('title')</title>
    <link rel="stylesheet" href="{{asset('dist/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{asset('dist/css/base.css')}}">
</head>
<body>
@yield('content')
<script src="{{ asset('dist/js/jquery-3.1.1.min.js') }}"></script>
<script src="{{ asset('dist/js/bootstrap.min.js') }}" type="text/javascript"></script>
@yield('footer-js')
</body>
</html>
