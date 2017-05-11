@extends('layouts.app')

@section('content')
    <div class="col-md-10">
        <div class="panel panel-default">
            <div class="panel-body">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#ID</th>
                            <th>Name</th>
                            <th>E-mail</th>
                            <th>注册时间</th>
                            <th>登录时间</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    @foreach ($users as $user)
                        <tr>
                            <th scope="row">{{ $user->id }}</th>
                            <td>{{ $user->name }}</td>
                            <td>{{ $user->email }}</td>
                            <td>{{ $user->created_at }}</td>
                            <td>{{ $user->updated_at }}</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-success btn-sm">修改</button>
                                    <button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <span class="caret"></span>
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a href="{{ url('/user/users/update',  [$user->id]) }}">修改</a></li>
                                        <li><a href="{{ url('/user/users/delete',  [$user->id]) }}">删除</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="{{ url('/user/users/view',  [$user->id]) }}">查看</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
                {!! $users->links() !!}
            </div>
        </div>
    </div>
@endsection
