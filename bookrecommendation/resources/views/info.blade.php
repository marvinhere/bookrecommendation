@extends('template')
@section('section')
<div class="container mt-5">
	<h1>Información</h1>
	<p>Un sistema de recomendaciones es una herramienta utilizada para generar y proporcionar sugerencias 
de artículos que un usuario en específico desea buscar. Estos sistemas utilizan algoritmos que filtran la 
información en base a los datos con los que se quieran o requieran trabajar. Son utilizado para personalizar 
lo que se le ofrecerá a cada usuario</p>
	<p>Relibro es una aplicación web que le permite a los usuarios a descubrir libros en base a los libros 
	seleccionados o guardados. Utiliza un algoritmo que detecta el historial del usuario para generar recomendaciones 
	personalizadas. <br><br>En este trabajo se presenta una propuesta diferente, la cual utiliza el diseño de las portadas y resúmenes de 
los libros para generar recomendaciones de libros personalizadas.
<br><br>
Sistema web desarrollado por Marvin Quiñónez bajo la licencia MIT. 2021.
</p>
<hr>
<h2>Forma de uso</h2>
	<ul>
		<li>En la página principal se encontrarán 2 libros generados al azar y una sección de libros generados por el sistema.</li>
		<li>Al dar click en las portadas de los libros se podrá acceder al perfil de este.</li>
		<li>En el perfil de cada libro se puede guardar el perfil para posterior búsqueda en la opción "Mi bilioteca"</li>
		<li>En el pefil de cada libro aparecerán nuevas recomendaciones generadas inteligentemente.</li>
		<li>El usuario puede explorar las opciones de la barra lateral o usar el buscador.</li>
	</ul>
</div>
@endsection