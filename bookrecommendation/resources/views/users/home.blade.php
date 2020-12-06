@extends('./template')

@section('section')
<style type="text/css">
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

     .bookcover-big{
        width: 200px;
        height: 350px;
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

    .black{
    	background-color: black;
    	color: white;
    }
   


</style>



<div class="container-fluid" style="margin-top: 100px;">

  <div class="row">

  	@foreach($books as $book)
    <div class="col">
      <div class="" style="">
          <div class="row">
            <div class="col-sm text-center">
            	<a href="{{route('book_profile',$book->id)}}">
            		<img class="bookcover-big rounded" src="{{$book->img}}">
            	</a>
            </div>
            <div class="col-sm text-left mt-4">
            	<a href="{{route('book_profile',$book->id)}}" style="text-decoration: none; color: black">
            		<h4>{{$book->title}}</h4>
            		@foreach($book->authors as $author)
                	<h5>{{$author->first_name}} {{$author->middle_name}} {{$author->last_name}}</h5>
                	@endforeach
            	</a>
                
                <div class="container" style="padding: 0px;">
                	@foreach($book->genres as $genre)
               		<button type="button" class="btn btn-warning btn-sm mt-1">{{$genre->genre}}</button>
               		@endforeach
                </div>
                <div class="container mt-4 col">
                  <div class="row mb-3">
                    <img class="reaction mr-2" src="https://img.icons8.com/flat_round/64/000000/filled-like.png"/><a>0</a>
                  </div>

                  <div class="row mb-3">
                    <img class="reaction mr-2" src="https://img.icons8.com/ios/50/000000/facebook-like--v1.png"/><a>0</a>
                  </div>
                  <div class="row mb-3">
                    <img class="reaction mr-2" src="https://img.icons8.com/material-outlined/50/000000/thumbs-down.png"/><a>0</a>
                  </div>
                    

                </div>
            </div>  
          </div>
              
        </div>
    </div>
    @endforeach

  </div>
</div>



<div class="container mb-5" style="margin-top: 70px;">
  <hr>
  <h3 class="mb-2">Recomendados</h3>
  <div class="container-fluid text-center mt-5">
    @foreach($recoms as $recom)
  <a href="{{route('book_profile',$recom->id)}}">
  <div class="container d-inline-block rounded" style="background-color: #fff; width: 15rem;">
    <div class="container text-center">
            <img class="bookcover rounded mt-3" src="{{$recom->img}}">  
        </div>
        <div class="container text-center mt-2 d-inline-block">
          <a class="title">{{$recom->title}}</a>
            <a class="author" style="">{{$recom->author->first_name}} - {{$recom->author->last_name}}</a>
        </div>    
        
  </div>
  </a>
  @endforeach
  </div>


</div>
<x-data-alert/>
<script type="text/javascript">
  $(document).ready(function() {  
  $('#cookieModal').modal('show');
});
</script>
@endsection