<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Animal extends Model
{
    use HasFactory;

    protected $table = 'animals';

    // Relación Many to One
    public function user(){
        return $this->belongsTo('App\Models\User', 'id_users');
    }

    // Relación One to One
    public function type(){
        return $this->belongsTo('App\Models\AnimalType', 'id_type');
    }












}
