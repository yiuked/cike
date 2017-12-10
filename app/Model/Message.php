<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    /**
     * 关联到模型的数据表
     *
     * @var string
     */
    protected $table = 'messages';
}
