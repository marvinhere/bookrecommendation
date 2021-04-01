@extends('template')
@section('section')
<style type="text/css">
    .bookcover{
        width: 100px;
        height: 150px;
    }
 </style>
<div class="container mt-5">
	<h1>Género {{$genre}}</h1>
</div>
<div class="container-fluid mt-5">
	@foreach($books as $book)
	<a href="{{route('book_profile',$book->id)}}">
	<div class="container d-inline-block rounded" style="background-color: #fff; width: 18rem;">
		<div class="container text-center">
            <img class="bookcover rounded mt-3" src="../{{$book->img}}">  
        </div>
        <div class="container text-center mt-2">
        	<a class="title">{{$book->title}}</a><br>
        
        </div>    
        
	</div>
	</a>
	@endforeach
	<div class="container text-center mt-3 mb-5">
		{{ $books->links() }}
	</div>
</div>
@endsection