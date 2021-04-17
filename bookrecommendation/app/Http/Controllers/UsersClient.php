<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Http;
use Illuminate\Http\Request;
use App\Models\authors;
use App\Models\book_authors;
use App\Models\book_covers;
use App\Models\book_genres;
use App\Models\books;
use App\Models\c_designs;
use App\Models\genres;
use App\Models\publishers;


class UsersClient extends Controller
{
    //

    public function home(){
    	$books = books::inRandomOrder()->limit(2)->get();
    	$i = 0;
  		foreach ($books as $b) {
  			$book = books::find($b->id)->authors()->get();
    		$books[$i]->authors = $book;
    		$genre = books::find($b->id)->genres()->get();
    		$books[$i]->genres = $genre;
    		$i++;
		}

        //recommendation only 4
        $datarequest = [
            'apikey' => 'abcd',
            'data' => '8',
            'k' =>'5'
        ];

        $response = Http::timeout(5)->get('http://127.0.0.1:5000/recommendation-cover',$datarequest);
        //return $response;
        $res = $response->serverError();
        $resuccess = $response->successful();
        $booksrecom = null;
        if($response==null){
            $booksrecom = books::inRandomOrder()->limit(1)->get();
            $a=0;
            foreach ($booksrecom as $b) {
                $book = books::find($b->id)->authors()->first();
                $booksrecom[$a]->author = $book;
                $a++;
            }
        }
        if($resuccess){

            $data = json_decode($response);
            $recomIds= null;
            $i = 0;
            foreach ($data as $d) {
                $recomIds[$i] = ((int)$d[0])+1;
                $i++;
            }

            $booksrecom = books::whereIn('id', $recomIds)->inRandomOrder()->get();
            $a=0;
            foreach ($booksrecom as $b) {
                $book = books::find($b->id)->authors()->first();
                $booksrecom[$a]->author = $book;
                $a++;
            }
        }
        

       
    	 $data = [
            'books'=>$books,
            'recoms'=>$booksrecom

        ];
    	return view('users/home')->with($data);
    }


    public function search(Request $request){
    	//$books = books::where('title','LIKE','%'.$request->data.'%')->get();
        
        $books = books::whereHas(
                'authors', function($q) use($request){
                    $q->where('last_name','LIKE','%'.$request->data.'%')
                    ->orWhere('first_name','LIKE','%'.$request->data.'%');
             }
        )->orWhere('title','LIKE','%'.$request->data.'%')
        ->simplePaginate(10);


        
        $i = 0;
    	foreach ($books as $b) {
            $book = books::find($b->id)->authors()->first();
            $books[$i]->author = $book;
            $i++;
        }

        $data = [
            'books'=>$books,
            'search_data'=>$request->data,
        ];
    	return view('search')->with($data);
    }

    public function connectApis(){
        $datarequest = [
            'apikey' => 'abcd',
            'download' => '4',
            'history' =>'none'
        ];

        $response = Http::get('http://127.0.0.1:5000/recommendation',$datarequest);
        $data = json_decode($response);
        $newarray = null;
        $i = 0;
        foreach ($data as $d) {
            $newarray[$i] = ((int)$d[0])+1;
            $i++;
        }
        
        return $newarray;
    }

    public function connectApi(){
        $datarequest = [
            'apikey' => 'abcd',
            'download' => '3',
            'history' =>'none'
        ];

        $response = Http::get('http://127.0.0.1:5000/recommendation',$datarequest);
        $data = json_decode($response);
        $recomIds= null;
        $i = 0;
        foreach ($data as $d) {
            $recomIds[$i] = ((int)$d[0])+1;
            $i++;
        }
        shuffle($recomIds);
        $booksrecom = books::whereIn('id', $recomIds)->inRandomOrder()->get();
        $a=0;
        foreach ($booksrecom as $b) {
            $book = books::find($b->id)->authors()->first();
            $booksrecom[$a]->author = $book;
            $a++;
        }
        return $booksrecom;
    }

    public function genreSearch($id){
        $books = genres::find($id)
        ->books()
        //->join('business','posts.business_id','=','business.user_id')
        ->simplePaginate(5);
        $genre = genres::find($id);
        $data = [
            'books'=>$books,
            'genre'=>$genre->genre
        ];

        return view('genre')->with($data);
    }
    

}
