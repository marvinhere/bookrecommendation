<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class books extends Model
{
    use HasFactory;

    public function genres()
    {
        return $this->belongsToMany(genres::class,'book_genres','book_id','genre_id');
    }

    public function authors()
    {
        return $this->belongsToMany(authors::class,'book_authors','book_id','author_id');
    }

    public function covers()
    {
        return $this->belongsToMany(c_designs::class,'book_covers','book_id','design_id');
    }
}
