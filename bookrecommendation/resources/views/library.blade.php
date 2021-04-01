@extends('template')
@section('section')
<style type="text/css">
   .bookcover{
        width: 150px;
        height: 250px;
        object-fit: cover;
        object-position: center;
    }

    .font15{
        font-size: 15px;
    }

    .reaction{
      width: 30px;
      height: 30px;
    }
</style>

<div class="container mt-5">
	<h1>Biblioteca</h1>
	<p>Aquí encontrará los libros que se han guardado.</p>
	<div class="container">
		<div class="container-fluid text-center mt-5">
    		@foreach($interests as $interest)
		 	<a href="{{route('book_profile',$interest->id)}}">
		  	<div class="container d-inline-block rounded" style="background-color: #fff; width: 15rem;">
		    	<div class="container text-center">
		            <img class="bookcover rounded mt-3" src="../{{$interest->img}}">  
		        </div><br>
		        <div class="container text-center mt-2 d-inline-block">
		          <!--<a class="title">{{$interest->title}} - </a>-->
		         
		        </div>    
		        
		  	</div>
		  	</a>
		  	@endforeach
		 </div>
	</div>
</div>

@endsection