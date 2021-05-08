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
use App\Models\User;
use App\Models\interests;
use App\Models\analytics;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;


class Dashboard extends Controller
{
    //
    public function dashboard(){
		
        $books = books::with("authors")->simplePaginate(20);
        $authors = authors::get();
    	$c_designs = c_designs::orderBy('name')->get();
    	$genres = genres::orderBy('genre')->get();
    	$publishers = publishers::get();
    	$data = [
    		'authors'=>$authors,
    		'c_designs'=>$c_designs,
    		'genres'=>$genres,
    		'publishers'=>$publishers,
            'books'=>$books
    	];
    	return view('dashboard')->with($data);
    }


    public function createNewBookProfile(Request $request){
    	$validate = $request->validate([
			'author'=>'required',
			'title'=>'required',
			'publisher'=>'required',
			'summary'=>'required',
			'total_pages'=>'required',
			'isbn'=>'required',
			'genre'=>'required',
			'cover_design'=>'required',
			'published_date'=>'required'
		]);
		try{
		DB::transaction(function () use ($request){
    	$authorv = $request->author;
    	$publisherv = $request->publisher;
    	
    	$image = $request->file('image');
    	$extension=$image->getClientOriginalExtension();
    	$filename =time().'.'.$extension;
    	$image->move('uploads/images/covers/', $filename);
    	$url_img = 'uploads/images/covers/'. $filename;

    	//Guardar en libro
    	$books = new books;
    	$books->title = $request->title;
		$books->published_date = $request->published_date;
		$books->summary = $request->summary;
		$books->total_pages = $request->total_pages;
		$books->isbn = $request->isbn;
		$books->img = $url_img;

		//Guardar editorial
    	if($publisherv=='selectPublisher'){
    		$books->publisher_id =$request->publisher_selected;
    	}
		if($request->publishername!=null){
    		$publisher = new publishers;
    		$publisher->name = $request->publishername;
    		$publisher->save();
    		$books->publisher_id = $publisher->id;
    	}
		$books->save();
		
		//Guardar autor
        $bookc = books::find($books->id);
		//$author = new book_authors;
		if ($authorv=='selectAuthor') {
    		//$author->author_id = $request->author_selected;
    		//$author->book_id = $books->id;
            $bookc->authors()->attach($request->author_selected);

    	}
		if($request->authorsname !=null && $request->authorslastname != null){
    		$newAuthor = new authors;
    		$newAuthor->first_name = $request->authorsname;
			$newAuthor->last_name = $request->authorslastname;
			

			if($request->authorsmname==null){
				$newAuthor->middle_name = '-';
			}else{
				$newAuthor->middle_name = $request->authorsmname;
			}
    		$newAuthor->save();
    		//$author->author_id = $newAuthor->id;
    		//$author->book_id = $books->id;

            $bookc->authors()->attach($newAuthor->id);
    	}
    	
        
        $bookc->genres()->attach($request->input('genre'));
    	//Guardar cubierta

    	$bookc->covers()->attach($request->input('cover_design'));//se le pasa el diseno id
		});
		
		 $datarequest = [
            'apikey' => env("RECOMM_PRIVATE_KEY")
        ];
	
		$response = Http::timeout(5)->get('http://127.0.0.1:5000/transform-cover',$datarequest);
		$response = Http::timeout(5)->get('http://127.0.0.1:5000/transform-summary',$datarequest);
    	return redirect('dashboard')->with('status', 'Listo!');
		
		} catch (\Exception $e) {
        return redirect('dashboard')->with('status', 'Error: Rellene todos los campos!');
		}

    }


public function editBookProfile(Request $request,$id){
    	
		$validate = $request->validate([
			'author'=>'required',
			'title'=>'required',
			'publisher'=>'required',
			'summary'=>'required',
			'total_pages'=>'required',
			'isbn'=>'required',
			'genre'=>'required',
			'cover_design'=>'required'
		]);
    	DB::transaction(function () use ($request,$id){
        $authorv = $request->author;
        $publisherv = $request->publisher;
        
        $image = $request->file('image');
        

        $bookc = books::find($id);
        //Guardar en libro
        
        $bookc->title = $request->title;
        $bookc->published_date = $request->published_date;
        $bookc->summary = $request->summary;
        $bookc->total_pages = $request->total_pages;
        $bookc->isbn = $request->isbn;

        if($image!=null){
        $extension=$image->getClientOriginalExtension();
        $filename =time().'.'.$extension;
        $image->move('uploads/images/covers/', $filename);
        $url_img = 'uploads/images/covers/'. $filename;
        $bookc->img = $url_img;
        }
        

        //Guardar editorial

        if($publisherv=='selectPublisher'){
           
                $bookc->publisher_id =$request->publisher_selected;
        
            
        }
		if($request->publishername!=null){
            $publisher = new publishers;
            $publisher->name = $request->publishername;
            $publisher->save();
            $bookc->publisher_id = $publisher->id;
        }
        $bookc->save();
        
        //Guardar autor
        //$bookc = books::find($books->id);
        //$author = new book_authors;
        
		
        if ($authorv=='selectAuthor') {
			$bookc->authors()->detach();
            //$author->author_id = $request->author_selected;
            //$author->book_id = $books->id;
			
            $bookc->authors()->attach($request->author_selected);

        }
		if($request->authorsname !=null && $request->authorslastname != null){
			
			$bookc->authors()->detach();
            $newAuthor = new authors;
			
			$newAuthor->first_name = $request->authorsname;
			$newAuthor->last_name = $request->authorslastname;
			

			if($request->authorsmname==null){
				$newAuthor->middle_name = '-';
			}else{
				$newAuthor->middle_name = $request->authorsmname;
			}
            
            
            $newAuthor->save();
            //$author->author_id = $newAuthor->id;
            //$author->book_id = $books->id;

            $bookc->authors()->attach($newAuthor->id);
        }
        
        $bookc->genres()->detach();
        $bookc->genres()->attach($request->input('genre'));
        //Guardar cubierta

        $bookc->covers()->detach();
        $bookc->covers()->attach($request->input('cover_design'));//se le pasa el diseno id

		});
		$datarequest = [
            'apikey' => env("RECOMM_PRIVATE_KEY")
        ];
	
		$response = Http::timeout(5)->get('http://127.0.0.1:5000/transform-cover',$datarequest);
		$response = Http::timeout(5)->get('http://127.0.0.1:5000/transform-summary',$datarequest);
        return back()->with('status', 'Listo!');
    }


    public function profileBook(Request $request, $id){
		
        $user = Auth::user();
		/*
		if($request->type!=null){
			$this->saveAnalytics($user->id,$request->type);
		}
		*/
        $interest = interests::where('user_id',$user->id)
        ->where('book_id',$id)->first();
		
		$last_interested = interests::where('user_id',$user->id)->orderBy('id', 'DESC')->first();
		//return $last_interested;
        $data = books::findOrFail($id);
        $books = books::findOrFail($id);
		//
        $author = $books->authors()->get();
		
        $cover = $books->covers()->get();
        $genre = $books->genres()->get();
        $selectedg = array();
        $selectedc = array();
        $i=0;

        foreach($cover as $c){
            $selectedc[$i] = $c->id;
            $i++;
        }

        $i=0;
        
        foreach($genre as $g){
            $selectedg[$i] = $g->id;
            $i++;
        }


        $authors = authors::get();
        $c_designs = c_designs::orderBy('name')->get();
        $genres = genres::orderBy('genre')->get();
        $publishers = publishers::get();

         //recommendation only 5
		$datarequest = "";
		if($last_interested){
			
			$datarequest = [
            'apikey' => env("RECOMM_PRIVATE_KEY"),
            'data' => $last_interested->id,
            'k'=>'5'
        ];
		}else{
			
			$datarequest = [
            'apikey' => env("RECOMM_PRIVATE_KEY"),
            'data' => $id,
            'k'=>'5'
        ];
		}
        
		$random = rand(1,2);
		$response = '';
		if($random == 1){
			$response = Http::timeout(5)->get('http://127.0.0.1:5000/recommendation-summary',$datarequest);
		}if($random==2){
			$response = Http::timeout(5)->get('http://127.0.0.1:5000/recommendation-cover',$datarequest);
		}
		$booksrecom = null;
		
        
        $res = $response->serverError();
        $resuccess = $response->successful();
        $booksrecom = null;
        if($res){
            $booksrecom = books::inRandomOrder()->limit(7)->get();
            $a=0;
            foreach ($booksrecom as $b) {
                $bo = books::find($b->id)->authors()->first();
                $booksrecom[$a]->author = $bo;
                $a++;
            }
        }
        if($resuccess){

            $data = json_decode($response);
            $recomIds= null;
            $i = 0;
            foreach ($data as $d) {
                //$recomIds[$i] = ((int)$d[0])+1;

                $recomIds[$i] = ((int)$d[0]); //Ya no se le suma 1 porque los ids estan corregidos
                $i++;
            }

            $booksrecom = books::whereIn('id', $recomIds)->inRandomOrder()->get();
            $a=0;
            foreach ($booksrecom as $b) {
                $book = books::find($b->id)->authors()->first();
                $booksrecom[$a]->author = $book;
                $a++;
            }
        }else{
            return 'error';
        }
        
        ///

        $data = [
            'authors'=>$authors,
            'c_designs'=>$c_designs,
            'genres'=>$genres,
            'publishers'=>$publishers,
            'books'=>$books,
            'genre'=>$selectedg,
            'cover'=>$selectedc,
            'author'=>$author,
            'recoms'=>$booksrecom,
            'interest'=>$interest,
			'recom_type'=>'1'
        ];
        return view('book_profile')->with($data);

    }
	
	private function saveAnalytics($id,$type){
		$anadata=[
				'user_id'=>$id,
				'recom_type'=>$type
			];
			$analytics = analytics::create($anadata);
	}

    public function delete(Request $request){
		DB::transaction(function () use ($request){
        $books = books::find($request->book_id);
        $books->genres()->detach();
        $books->authors()->detach();
        $books->covers()->detach();
        $books->delete();
		});
		 $datarequest = [
            'apikey' => env("RECOMM_PRIVATE_KEY")
        ];
	
		$response = Http::timeout(5)->get('http://127.0.0.1:5000/transform-cover',$datarequest);
		$response = Http::timeout(5)->get('http://127.0.0.1:5000/transform-summary',$datarequest);
        return redirect('dashboard')->with('status', 'Libro eliminado!');
    }

    ///este es test
    public function getAllBooks(){
        $books = books::with("authors")->first();
        return $books;
    }
}
