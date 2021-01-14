@extends('template')
@section('section')
<style type="text/css">
    .bookcover{
        width: 100px;
        height: 150px;
    }

    .font15{
        font-size: 15px;
    }
    @import url(https://fonts.googleapis.com/css?family=Open+Sans);
* {
  margin: 0;
  padding: 0;
  border: 0;
  outline: 0;
  box-sizing: border-box;
}

*:before, *:after {
  box-sizing: border-box;
}



.tags {
  
  box-shadow: 0px 0px 1px rgba(0, 0, 0, 0.25);
}
.tags input {
  display: block;
  float: left;
  font-size: 1em;
  font-family: 'Open Sans', sans-serif;
  padding: 0.25em 0;
  margin-bottom: 0.5em;
}
.tags .tag {
  display: block;
  float: left;
  background-color: rgba(52, 152, 219, 0.5);
  padding: 0.25em 0.5em;
  border-radius: 3px;
  margin-right: 0.5em;
  margin-bottom: 0.5em;
  cursor: pointer;
}
.tags .tag.highlight {
  background-color: rgba(231, 76, 60, 0.5);
}
.tags:after {
  content: "";
  clear: both;
  display: table;
}

</style>
<div class="container-fluid mt-5">
  @if (session('status'))
    <div class="alert alert-success">
        {{ session('status') }}
    </div>
  @endif
    
    <h1>Dashboard<h1>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
        Nuevo documento
    </button>
    <div class="text-center mt-5">

        <div class="d-inline-block" style="width: 18rem;">
            <div class="container text-center">
                <img class="bookcover rounded" src="{{url('/images/portada1.jpg')}}">  
            </div>
            <div class="container text-center mt-2">
                <h4>Surviving the Abbys</h4>
                <h5>Don Brown</h5>
            </div>    
        </div>

        <div class="d-inline-block" style="width: 18rem;">
            <div class="container text-center">
                <img class="bookcover rounded" src="{{url('/images/portada1.jpg')}}">  
            </div>
            <div class="container text-center mt-2">
                <h4>Surviving the Abbys</h4>
                <h5>Don Brown</h5>
            </div>    
        </div>


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
        
          <form action="{{route('newBook')}}" method="post" enctype="multipart/form-data">
          @csrf
            <div class="form-group">
                <label for="exampleFormControlFile1">Seleccionar cubierta</label>
                <input type="file" class="form-control-file" id="exampleFormControlFile1" name="image">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1">Titulo</label>
                <input type="text" class="form-control" placeholder="Ingresar nombre del libro" name="title">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">Paginas totaltes</label>
                <input type="text" class="form-control" placeholder="Ingresar paginas totales del libro" name="total_pages">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">ISBN</label>
                <input type="text" class="form-control" placeholder="Ingresar ISBN" name="isbn">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail1">Genero</label>
                <select multiple="" class="form-control" name="genre[]">
                  
                  @foreach($genres as $g)
                    <option value="{{$g->id}}">{{$g->genre}}</option>
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
         @foreach($authors as $author)
        <option value="{{$author->id}}">{{$author->first_name}}  {{$author->middle_name}} {{$author->last_name}}</option>
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
        <option value="{{$publisher->id}}">{{$publisher->name}}</option>
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
                <input type="date" class="form-control" name="published_date">
            </div>

           

             <div class="form-group">
                <label for="exampleFormControlSelect1">Diseño cubierta</label>
                <select multiple class="form-control" id="exampleFormControlSelect1" name="cover_design[]" style="height: 400px;">
                  @isset($c_designs)
                  @foreach($c_designs as $design)
                    <option value="{{$design->id}}">{{$design->name}}</option>
                  @endforeach
                 @endisset

                </select>
              </div>

            
            
            <div class="form-group">
                <label for="exampleInputEmail1">Resumen del libro</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="summary"></textarea>
            </div>
            
           
            
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
   (function () {
    var app;
    $(document).ready(function () {
        return app.init();
    });
    app = {
        can_delete: false,
        can_delete_id: 0,
        init: function () {
            return this.bind_events();
        },
        bind_events: function () {
            $(document).on('click', '.tags .tag', function (e) {
                var index;
                index = $(this).index() + 1;
                return app.delete_tag(index);
            });
            return $(document).on('keyup', '.tags input', function (e) {
                var key;
                key = e.keyCode || e.which;
                if (key === 13 || key === 188) {
                    app.add_tag($(this).val().replace(',', ''));
                    return $(this).val('');
                } else if (key === 8) {
                    if ($(this).val() === '') {
                        return app.delete_tag();
                    }
                } else {
                    app.can_delete = false;
                    return $('.highlight').removeClass('highlight');
                }
            });
        },
        delete_tag: function (id) {
            if (id == null) {
                id = 0;
            }
            if (this.can_delete && id === this.can_delete_id) {
                $('.tags .tag.highlight').remove();
                this.can_delete = false;
                return this.can_delete_id = 0;
            } else {
                $('.tags .tag').removeClass('highlight');
                this.can_delete = true;
                if (!id) {
                    $('.tags .tag:last-of-type').addClass('highlight');
                    return this.can_delete_id = 0;
                } else {
                    $('.tags .tag:nth-of-type(' + id + ')').addClass('highlight');
                    return this.can_delete_id = id;
                }
            }
        },
        add_tag: function (name) {
            if (name !== '') {
                return $('.tags input').before('<div class=\'tag\'>' + name + '</div>');
            }
        }
    };
}.call(this));



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