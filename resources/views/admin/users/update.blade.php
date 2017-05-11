@extends('layouts.app')

@section('content')
    <div class="col-md-10">
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-horizontal" method="post">
                    <input type="hidden" name="_token" value="{{csrf_token()}}">
                    <input type="hidden" name="id" value="{{ $user->id }}">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputEmail3" placeholder="Name" name="name" value="{{ $user->name }}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="inputEmail3" placeholder="Email" value="{{ $user->email }}" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPassword3" name="password" placeholder="Password">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">更新</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
