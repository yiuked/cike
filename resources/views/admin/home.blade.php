@extends('layouts.app')

@section('content')
    <div class="col-md-10">
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-horizontal" action="{{url('/user/credit/auth')}}" method="post">
                    <input type="hidden" name="_token" value="{{csrf_token()}}">
                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputEmail3" name="realname" placeholder="姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">身份证</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputPassword3" name="card_id" placeholder="身份证">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">授权</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
