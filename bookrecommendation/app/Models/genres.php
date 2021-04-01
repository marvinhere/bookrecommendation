<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class genres extends Model
{
    use HasFactory;


    public function books()
    {
        return $this->belongsToMany(books::class,'book_genres','genre_id','book_id');
    }

    

}
