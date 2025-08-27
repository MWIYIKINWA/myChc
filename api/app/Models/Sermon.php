<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sermon extends Model
{
    /** @use HasFactory<\Database\Factories\SermonFactory> */
    use HasFactory;

    protected $fillable = [
        'title',
        'scripture',
        'message'
    ];

    public function getRouteKeyName()
    {
        return 'id';
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

}