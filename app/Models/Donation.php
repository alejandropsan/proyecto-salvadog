<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Donation extends Model
{
    use HasFactory;

    protected $table = 'donations';

    // Relación Many to Many
    public function animal_donation(){
        return $this->belongsToMany('App\Models\Animal');
    }

    // Relación Many to One
    public function user_donation(){
        return $this->belongsTo('App\Models\User', 'id_user');
    }














}
