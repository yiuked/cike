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

    /**
     * Get all of the post's comments.
     */
    public function attachments()
    {
        // hasMany
        return $this->hasMany('App\Model\MessageAttachment');
    }
}
