@extends('layouts.app')

@section('content')
    <div class="col-md-10">
        <div class="panel panel-default">
            <div class="panel-body">
                <dl class="dl-horizontal">
                    <dt>Name</dt>
                    <dd> {{ $user->name }}</dd>
                    <dt>Email</dt>
                    <dd> {{ $user->email }}</dd>
                    <dt>密码</dt>
                    <dd> {{ $user->password }}</dd>
                    <dt>Token</dt>
                    <dd> {{ $user->remember_token }}</dd>
                    <dt>注册时间</dt>
                    <dd> {{ $user->created_at }}</dd>
                    <dt>最后一次登录时间</dt>
                    <dd> {{ $user->updated_at }}</dd>
                </dl>
            </div>
        </div>
    </div>
@endsection
