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

.wrapper {
    display: flex;
    align-items: stretch;
}

#sidebar {
    min-width: 250px;
    max-width: 250px;
     box-shadow: 1px 0 10px -2px #888;
     padding-right: 10px;
     padding-left: 10px;
}

#sidebar.active {
    margin-left: -250px;
}

a[data-toggle="collapse"] {
    position: relative;
}

.dropdown-toggle::after {
    display: block;
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
}

@media (max-width: 768px) {
    #sidebar {
        margin-left: -250px;
    }
    #sidebar.active {
        margin-left: 0;
    }
}

#sidebar {
    /* don't forget to add all the previously mentioned styles here too */
    background: white;
    color: #000;
    transition: all 0.3s;
}

#sidebar .sidebar-header {
    padding: 20px;
    background: #fff;
    color: black;
}

#sidebar ul.components {
    padding: 20px 0;
    border-bottom: 1px solid #47748b;
}

#sidebar ul p {
    color: #black;
    padding: 10px;
}

#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em;
    display: block;
    color: black;
}
#sidebar ul li a:hover {
    color: #FFC300;
    background: #fff;
    text-decoration: none;
    font-weight: bold;
}

#sidebar ul li.active > a, a[aria-expanded="true"] {
    color: #fff;
    background: #FFC300;
    font-weight: bold;
    border-radius: 15px;
}

  </style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light shadow" style="background-color: #fff; box-shadow:0px 1px 6px 0px #D5D5D5;">
  <a class="navbar-brand" href="#" style=" color: black;">
  <strong>
    ReLibro
  </strong>

</a>


  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <div class="navbar-nav mr-auto">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item {{ Route::currentRouteName() == 'home' ? 'active' : '' }} {{Request::is('/') ? 'active' : '' }}">
                <a class="nav-link" href="/home">Home</a>
            </li>
            <li class="nav-item {{ Route::currentRouteName() == 'library' ? 'active' : '' }}">
                <a class="nav-link" href="/library">Mi Biblioteca</a>
            </li>
			@if(Auth::user()->type == 'admin')
				<li class="nav-item {{ Route::currentRouteName() == 'dashboard' ? 'active' : '' }}">
					<a class="nav-link" href="/dashboard">Dashboard</a>
				</li>
			@endif
			<li class="nav-item {{ Route::currentRouteName() == 'info' ? 'active' : '' }}">
					<a class="nav-link" href="/info">Info</a>
			</li>
        </ul>
    </div>
    

    <form class="form-inline my-2 my-lg-0" action="{{route('search')}}" method="get">
          @csrf
        <input class="form-control mr-sm-2" type="text" placeholder="Buscar" name="data" style="width: 300px;">
      <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Buscar</button>
    </form>
    <a class="ml-5" href="/user/profile" style="font-weight: bold;">{{Auth::user()->name}}!</a>
  </div>
</nav>
<div class="wrapper">

    <!-- Sidebar -->
    <nav id="sidebar">
        <div class="sidebar-header">
            <h3>Descubre</h3>
        </div>

        <ul class="list-unstyled components">
            <p style="font-size: 20px;"><strong>Tus opciones</strong></p>

            <li class="{{Request::is('home') ? 'active' : '' }} {{Request::is('/') ? 'active' : '' }}">
                <a href="/">Home</a>
            </li>
            <li class="{{Request::is('genres/1') ? 'active' : '' }}">
                <a href="/genres/1">Aventuras</a>
            </li>
            <li class="{{Request::is('genres/2') ? 'active' : '' }}">
                <a href="/genres/2">Ficción</a>
            </li>
            <li class="{{Request::is('genres/3') ? 'active' : '' }}">
                <a href="/genres/3">Ciencia Ficción</a>
            </li>
        </ul>
    </nav>

    <!-- Page Content -->
    <div id="content">
        <!-- We'll fill this with dummy content -->
        @yield('section')
    </div>

</div>   

<script type="text/javascript">
  $(document).ready(function () {

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });

});
</script>
</body>
</html>