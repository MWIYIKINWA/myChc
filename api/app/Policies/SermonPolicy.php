<?php

namespace App\Policies;

use App\Models\Sermon;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class SermonPolicy
{

    public function modify(User $user, Sermon $sermon): Response
    {
        return $user->id === $sermon->user_id ? Response::allow() : Response::deny("you don't own this post");
    }
}