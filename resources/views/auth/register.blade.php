@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-default">
                    <div class="panel-heading">Register</div>
                    <div class="panel-body">
                        <form class="form-horizontal" role="form" method="POST" action="{{ route('register') }}">
                            {{ csrf_field() }}


                            <div class="form-group{{ $errors->has('phone') ? ' has-error' : '' }}">
                                <label for="phone" class="col-md-4 control-label">手机号码</label>

                                <div class="col-md-6">
                                    <input id="phone" type="tel" class="form-control" name="phone"
                                           value="{{ old('phone') }}" required>

                                    @if ($errors->has('phone'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('phone') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                                <label for="password" class="col-md-4 control-label">密码</label>

                                <div class="col-md-6">
                                    <input id="password" type="password" class="form-control" name="password" required>

                                    @if ($errors->has('password'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group{{ $errors->has('code') ? ' has-error' : '' }}">
                                <label for="password-confirm" class="col-md-4 control-label">验证码</label>

                                <div class="col-md-6">
                                    <div class="input-group">
                                        <input id="password-confirm" type="text" class="form-control"
                                               value="{{ old('code') }}" name="code" required>
                                        <span class="input-group-addon send-code" role="button">发送验证码</span>
                                    </div>
                                    @if ($errors->has('code'))
                                        <span class="help-block">
                                        <strong>{{ $errors->first('code') }}</strong>
                                    </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-4">
                                    <button type="submit" class="btn btn-primary">
                                        注册
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('javascript')
    <script>
        $(document).ready(function () {
            var sendCode = function () {
                $('.send-code').off('click', sendCode);
                $.post('{{ route('sms')}}', {
                    phone: $('#phone').val(),
                    _token: '{{ csrf_token() }}'
                }, function (data) {
                    if (data.status == 'SUCCESS') {
                        $('#phone').parent().find('.help-block').remove();
                        $('#phone').parent().parent().removeClass('has-error');
                        time()
                    } else {
                        if ($('#phone').parent().has('.help-block').length > 0) {
                            $('#phone').parent().find('.help-block strong').html(data.errorMessage);
                        } else {
                            $('#phone').parent().parent().addClass('has-error')
                            $('#phone').parent().append('<span class="help-block"><strong>' + data.errorMessage + '</strong></span>');
                        }
                        $('.send-code').on('click', sendCode);
                    }
                });
            }
            $('.send-code').on('click', sendCode);

            var wait = 60;

            function time() {
                if (wait <= 0) {
                    $('.send-code').html('没有收到？重试!');
                    wait = 60;
                    $('.send-code').on('click', sendCode);
                } else {
                    $('.send-code').html(wait + '秒后重新发送');
                    wait--;
                    setTimeout(function () {
                        time()
                    }, 1000)
                }
            }
        });
    </script>
@endsection
