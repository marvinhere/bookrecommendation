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

@if (session('status'))
    <div class="alert alert-success">
        {{ session('status') }}
    </div>
  @endif
  
@if($errors->any())
	<div class="alert alert-danger">
		<ul>
			@foreach($errors->all() as $error)
				<li>{{$error}}</li>
			@endforeach
		</ul>
	</div>

@endif


@if(Auth::user()->type == 'admin')
<div class="container mt-2">
    <button type="button" class="btn btn-primary mr-2 d-inline-block" data-toggle="modal" data-target="#exampleModal">
      Editar
    </button>
    <form action="{{route('delete')}}" method="post" class="d-inline-block">
          @csrf
      <input type="hidden" name="book_id" value="{{$books->id}}">
      <button type="submit" class="btn btn-danger">
      Eliminar
    </button>
    </form>
    
</div>
@endif
<div class="container" style="margin-top: 100px;">
  <div class="row">
    <div class="col">
      <div class="" style="">
          <div class="row">
            <div class="col-sm text-center">
                <img class="bookcover rounded" src="../{{$books->img}}">  
            </div>
            <div class="col-sm text-left mt-5">
                <h4>{{$books->title}}</h4>
                <h5>{{$author[0]->first_name}} {{$author[0]->middle_name}} {{$author[0]->last_name}}</h5>

                @if(!empty($interest) && $interest->count()>0)
                <form action="{{route('remove_book',$books->id)}}" method="post">
                  @csrf
                <button class="btn btn-primary" style="width: 200px;">Guardado</button>
                </form>
                @else
                  <form action="{{route('save_book',$books->id)}}" method="post">
                  @csrf
                <button class="btn btn-warning" style="width: 200px;">Guardar Libro</button>
              </form>
                @endif
                <div class="col text-left">
                  

                </div>
            </div>  
          </div>
              
        </div>
    </div>
    <div class="col text-center">
      <h3>Resumen</h3>
      <div class="container text-left">
        <p>
        {{$books->summary}}
      </p>
      </div>
      
    </div>
  </div>
</div>



<div class="container mb-5" style="margin-top: 70px;">
  <hr>
  <h3 class="mb-2">Recomendados</h3>
   <div class="container-fluid text-center mt-5">
    @foreach($recoms as $recom)
  <!--<a href="{{route('book_profile',$recom->id)}}">-->
  <a href="/profile/{{$recom->id}}?type={{$recom_type}}">
  <div class="container d-inline-block rounded" style="background-color: #fff; width: 15rem;">
    <div class="container text-center">
            <img class="bookcover rounded mt-3" src="../{{$recom->img}}">  
        </div><br>
        <div class="container text-center mt-2 d-inline-block">
          <!--
          <a class="title">{{$recom->title}} - </a>
            <a class="author" style="">{{$recom->author->first_name}} {{$recom->author->last_name}}</a>
          -->
        </div>    
        
  </div>
  </a>
  @endforeach
  </div>


</div>





<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo libro</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
          <form action="{{route('editBook',$books->id)}}" method="post" enctype="multipart/form-data">
          @csrf
            <div class="form-group">
                <label for="exampleFormControlFile1">Seleccionar cubierta</label>
                <input type="file" class="form-control-file" id="exampleFormControlFile1" name="image">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">Titulo</label>
                <input type="text" class="form-control" placeholder="Ingresar nombre del libro" name="title" value="{{$books->title}}">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">Paginas totaltes</label>
                <input type="text" class="form-control" placeholder="Ingresar paginas totales del libro" name="total_pages" value="{{$books->total_pages}}">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">ISBN</label>
                <input type="text" class="form-control" placeholder="Ingresar ISBN" name="isbn" value="{{$books->isbn}}">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">Genero</label>
                <select multiple class="form-control" name="genre[]">
                 
                  @foreach($genres as $g)
                    <option value="{{$g->id}}" @if(in_array($g->id,$genre)) selected @endif>{{$g->genre}}</option>
                 @endforeach
                </select>
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">Autor</label>
            </div>

          <div class="form-check">
          <input class="form-check-input" type="radio" id="authorselect" name="author" value="selectAuthor" onchange="detectAuthor()" checked>
          <label class="form-check-label" for="gridRadios1">
            Selecciona un autor
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" id="authorregister" name="author" value="newAuthor" onchange="detectAuthor()">
          <label class="form-check-label" for="gridRadios2" >
            Registrar nuevo autor
          </label>
        </div>

         <div class="form-group" id="select_author">
      <label for="inputState">Selecciona un autor</label>
      <select id="inputState" class="form-control" name="author_selected">

        @isset($authors)
         @foreach($authors as $a)
         
         @foreach($author as $au)
         @if($a->id == $au->id)
         <option selected="true" value="{{$a->id}}">{{$a->first_name}}  {{$a->middle_name}} {{$a->last_name}}</option>
         @else
<option value="{{$a->id}}">{{$a->first_name}}  {{$a->middle_name}} {{$a->last_name}}</option>
         @endif
         @endforeach
        
       
        @endforeach
        @endisset

      </select>
    </div>
  <div id="register_author" style="display: none;">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Nombres:</label>
            <input type="text" class="form-control padre" name="authorsname" id="fathersname">
          </div>

          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Segundo nombre:</label>
            <input type="text" class="form-control padre" name="authorsmname" id="fatherslastname">
          </div>

          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Apellidos:</label>
            <input type="text" class="form-control padre" name="authorslastname" id="fatherslastname">
          </div>


  </div>


            <!-- aquie empieza -->
            <div class="form-group">
                <label for="exampleInputEmail1">Editorial</label>
            </div>

          <div class="form-check">
          <input class="form-check-input" type="radio" id="publisherselect" name="publisher" value="selectPublisher" onchange="detectPublisher()" checked>
          <label class="form-check-label" for="gridRadios1">
            Selecciona una editorial
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" id="publisherregister" name="publisher" value="newPublisher" onchange="detectPublisher()">
          <label class="form-check-label" for="gridRadios2" >
            Registrar Editorial Nueva
          </label>
        </div>

         <div class="form-group" id="select_publisher">
      <label for="inputState">Selecciona una Editorial</label>
      <select id="inputState" class="form-control" name="publisher_selected">
        @isset($publishers)
         @foreach($publishers as $publisher)
         @if($publisher->id==$books->publisher_id)
        <option value="{{$publisher->id}}" selected="true">{{$publisher->name}}</option>
          @else
          <option value="{{$publisher->id}}">{{$publisher->name}}</option>
          @endif
        @endforeach
        @endisset
      </select>
    </div>
  <div id="register_publisher" style="display: none;">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Nombre de la Editorial:</label>
            <input type="text" class="form-control publisher" name="publishername" id="publishername">
          </div>
  </div>


            <!-- aqui termina -->
            <div class="form-group">
                <label for="exampleInputEmail1">Año de publicación</label>
                <input type="date" class="form-control" name="published_date" value="{{$books->published_date}}">
            </div>

           

             <div class="form-group">
                <label for="exampleFormControlSelect1">Diseño cubierta</label>
                <select multiple class="form-control" id="exampleFormControlSelect1" name="cover_design[]">
                  @isset($c_designs)
                  
                  @foreach($c_designs as $design)
                  
                 <option value="{{$design->id}}" @if(in_array($design->id,$cover)) selected @endif>{{$design->name}}</option>
                  @endforeach
                 @endisset

                </select>
              </div>

            
            
            <div class="form-group">
                <label for="exampleInputEmail1">Resumen del libro</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="summary">{{$books->summary}}</textarea>
            </div>
            
           
            
            <button type="submit" class="btn btn-primary">Guardar</button>
        </form>

      </div>

    </div>
  </div>
</div>

<script>



//Para autores
function detectAuthor(){
  var authorselect = document.getElementById("authorselect").checked;
  var authorregister = document.getElementById("authorregister").checked;
  var select_author = document.getElementById('select_author');
  var register_author = document.getElementById('register_author');

  if(authorselect==true){
    authorregister.checked = 'false';
    select_author.style.display = 'block';
    register_author.style.display = 'none'
  }

  if(authorregister==true){
  
    authorselect.checked = 'true';
    select_author.style.display = 'none';
    register_author.style.display = 'block'
  }
}


function detectPublisher(){
  var publisherselect = document.getElementById("publisherselect").checked;
  var publisherregister = document.getElementById("publisherregister").checked;
  var select_publisher = document.getElementById('select_publisher');
  var register_publisher = document.getElementById('register_publisher');

  if(publisherselect==true){
    publisherregister.checked = 'false';
    select_publisher.style.display = 'block';
    register_publisher.style.display = 'none'
  }

  if(publisherregister==true){
  
    publisherselect.checked = 'true';
    select_publisher.style.display = 'none';
    register_publisher.style.display = 'block'
  }
}

</script>

@endsection