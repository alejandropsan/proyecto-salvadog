<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Complaint extends Model
{
    use HasFactory;

    protected $table = 'complaints';

    // Relación Many to Many
    public function animal(){
        return $this->belongsToMany('App\Models\Animal');
    }

















}
