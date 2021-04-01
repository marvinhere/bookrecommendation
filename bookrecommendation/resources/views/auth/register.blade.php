<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/Wruczek/Bootstrap-Cookie-Alert@gh-pages/cookiealert.css">
  <script src="https://cdn.jsdelivr.net/gh/Wruczek/Bootstrap-Cookie-Alert@gh-pages/cookiealert.js"></script>
<style type="text/css">
    .bold{
        font-weight: bold;
    }

    .big{
        font-size: 26px;
    }

    .cardForm{
        width: 400px;
        box-shadow: 0px 5px 10px #E3E3E3;
        padding: 50px;
        border-radius: 15px
    }
</style>
</head>
<body>
    <div class="container text-center mt-5">
        <h1 class="bold big">Relibro</h1>
    </div>
    <div class="container text-center mt-5">
        <div class="container cardForm mt-5 text-left">
            <x-jet-validation-errors class="mb-4" />

        <form method="POST" action="{{ route('register') }}">
            @csrf

            <div class="form-group">
                <label>Nombre</label>
                <input id="name" class="form-control" type="text" name="name" placeholder="Nombre" required autofocus autocomplete="name" />
            </div>

            <div class="mt-4 form-group">
                <label>Email</label>
                <input id="email" class="form-control" type="email" name="email" placeholder="Email" required />
            </div>

            <div class="mt-4 form-group">
                <label>Contraseña</label>
                <x-jet-input id="password" class="form-control" type="password" name="password" required />
            </div>

            <div class="form-group">
                <label>Confirme contraseña</label>
                <input id="password_confirmation" class="form-control" type="password" name="password_confirmation" placeholder="Contraseña" required/>
            </div>

            <div class="flex items-center justify-end mt-4">
                <a class="underline text-sm text-gray-600 hover:text-gray-900" href="{{ route('login') }}">
                    {{ __('Ya está registrado?') }}
                </a>
                <div class="container text-center mt-4">
                    <button class="btn btn-primary d-block" style="width: 100%;">
                    {{ __('Registrar') }}
                    </button>
                </div>
                
            </div>
        </form>
        </div>
    </div>
        
    </body>
    </html>