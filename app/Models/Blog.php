<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
    use HasFactory;

    protected $table = 'blog';

    // Relación Many to One
    public function user(){
        return $this->belongsTo('App\Models\User', 'id_user');
    }











}
