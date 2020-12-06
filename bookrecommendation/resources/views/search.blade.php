@extends('template')
@section('section')
<style type="text/css">
.drop-shadow{
   box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.12) !Important;
}

.bookcover{
        width: 155px;
        height: 250px;
        object-fit: cover;
    }

.title{
	font-size: 15px;
	text-decoration: none;
}

.author{
	font-size: 15px;
	text-decoration: none;
	color: #FF5733 !Important;
}
</style>
<div class="container mt-5">
	<h3>Buscas {{$search_data}}</h3>
</div>
<div class="container-fluid mt-5">
	@foreach($books as $book)
	<a href="{{route('book_profile',$book->id)}}">
	<div class="container d-inline-block rounded" style="background-color: #fff; width: 18rem;">
		<div class="container text-center">
            <img class="bookcover rounded mt-3" src="{{$book->img}}">  
        </div>
        <div class="container text-center mt-2">
        	<a class="title">{{$book->title}}</a><br>
            <a class="author" style="">{{$book->author->first_name}} {{$book->author->last_name}}</a>
        </div>    
        
	</div>
	</a>
	@endforeach
	<div class="container text-center">
		{{ $books->links() }}
	</div>
</div>
@endsection