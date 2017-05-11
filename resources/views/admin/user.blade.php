@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <h2>用户列表</h2>
            <table class="table table-striped table-bordered">
                <tr>
                    <th>ID</th>
                    <th>姓名</th>
                    <th>邮箱</th>
                    <th>注册时间</th>
                    <th>最后一次登录</th>
                    <th>操作</th>
                </tr>
                <?php foreach ($users as $user): ?>
                <tr>
                    <td><?php echo $user->id; ?></td>
                    <td><?php echo $user->name; ?></td>
                    <td><?php echo $user->email; ?></td>
                    <td><?php echo $user->created_at; ?></td>
                    <td><?php echo $user->updated_at; ?></td>
                    <td><a href="">修改</a></td>
                </tr>
                <?php endforeach; ?>
            </table>
        </div>
    </div>
</div>
@endsection
