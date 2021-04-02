-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2021 a las 03:00:13
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `srlbcr`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `authors`
--

INSERT INTO `authors` (`id`, `first_name`, `middle_name`, `last_name`, `created_at`, `updated_at`) VALUES
(1, 'V', 'E', 'Schwab', '2020-12-06 11:30:25', '2020-12-06 11:30:25'),
(2, 'Richard', '-', 'Osman', '2020-12-06 11:33:06', '2020-12-06 11:33:06'),
(3, 'Carmen', '-', 'Posadas', '2020-12-06 11:35:43', '2020-12-06 11:35:43'),
(4, 'Julia', '-', 'Navarro', '2020-12-06 11:38:04', '2020-12-06 11:38:04'),
(5, 'Cesar', '-', 'Pérez Gellida', '2020-12-06 11:40:40', '2020-12-06 11:40:40'),
(6, 'Martha', '-', 'Cillán', '2020-12-06 11:43:22', '2020-12-06 11:43:22'),
(7, 'Juan', '-', 'Gómez Jurado', '2020-12-07 00:39:19', '2020-12-07 00:39:19'),
(8, 'Elvira', '-', 'Sastre', '2020-12-07 00:43:19', '2020-12-07 00:43:19'),
(9, '72Kilos', '-', '-', '2020-12-07 00:45:12', '2020-12-07 00:45:12'),
(10, 'Dr. Seuss', '-', '-', '2020-12-07 00:48:59', '2020-12-07 00:48:59'),
(11, 'Geronimo', '-', 'Stilton', '2020-12-07 00:53:50', '2020-12-07 00:53:50'),
(12, 'Gianni', '-', 'Rodari', '2020-12-07 00:57:54', '2020-12-07 00:57:54'),
(13, 'Frank', '-', 'Herbert', '2020-12-14 10:05:27', '2020-12-14 10:05:27'),
(14, 'Max', '-', 'Brooks', '2020-12-14 10:09:42', '2020-12-14 10:09:42'),
(15, 'Patrick', '-', 'Rothfuss', '2020-12-14 10:14:48', '2020-12-14 10:14:48'),
(16, 'Andy', '-', 'Weir', '2020-12-14 10:18:26', '2020-12-14 10:18:26'),
(17, 'Javier', '-', 'Amezaga', '2020-12-14 10:25:00', '2020-12-14 10:25:00'),
(18, 'Stephen', '-', 'King', '2020-12-14 10:29:02', '2020-12-14 10:29:02'),
(19, 'Sir Arthur', 'Conan', 'Doyle', '2020-12-14 10:46:04', '2020-12-14 10:46:04'),
(20, 'Pierra', '-', 'Lemaitre', '2020-12-14 10:55:05', '2020-12-14 10:55:05'),
(21, 'Luz', '-', 'Gabás', '2020-12-14 11:04:11', '2020-12-14 11:04:11'),
(22, 'José', 'Luis', 'Sampedro', '2020-12-14 11:18:26', '2020-12-14 11:18:26'),
(23, 'Friedrich', '-', 'Nietzsche', '2020-12-14 11:27:30', '2020-12-14 11:27:30'),
(24, 'René', '-', 'Descartes', '2020-12-14 11:30:23', '2020-12-14 11:30:23'),
(25, 'Yuval', 'Noah', 'Harari', '2020-12-14 11:38:55', '2020-12-14 11:38:55'),
(26, 'Francisco', '-', 'Ibáñez', '2020-12-14 11:46:36', '2020-12-14 11:46:36'),
(27, 'Alan', '-', 'Moore', '2020-12-14 11:54:27', '2020-12-14 11:54:27'),
(28, 'Juan', '-', 'Vicente', '2020-12-14 11:57:34', '2020-12-14 11:57:34'),
(29, 'Dolores', '-', 'Redondo', '2020-12-14 12:00:30', '2020-12-14 12:00:30'),
(30, 'Dulce', '-', 'Chacón', '2020-12-14 12:09:36', '2020-12-14 12:09:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `publisher_id` bigint(20) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_pages` smallint(6) NOT NULL,
  `isbn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_date` date NOT NULL,
  `img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO `books` (`id`, `publisher_id`, `title`, `total_pages`, `isbn`, `published_date`, `img`, `summary`, `created_at`, `updated_at`) VALUES
(1, 1, 'La vida invisible de Addie Larue', 180, '123656-6565-5656', '2020-12-05', 'uploads/images/covers/1607232624.jpg', 'Tras hacer un pacto con el diablo, Addie entrega su alma a cambio de la inmortalidad. Sin embargo, ningún trato faustiano está exento de consecuencias: el diablo le entregará la inmortalidad que tanto desea, pero le quitará algo que ella anhelará durante toda su existencia: la posibilidad de ser recordada.\r\nAddie abandona su pequeño pueblo natal en la Francia del siglo xviii y comienza un viaje que la lleva por todo el mundo, mientras aprende a vivir una vida en la que nadie la recuerda y todo lo que posee acaba perdido o roto. Durante trescientos años, Addie LaRue no será más que la musa de numerosos artistas a lo largo de la historia, y tendrá que aprender a enamorarse de nuevo cada día, y a ser olvidada a la mañana siguiente.\r\nSu único compañero en este viaje es su oscuro demonio de hipnóticos ojos verdes, quien la visita cada año en el día del aniversario de su trato. Completamente sola, a Addie no le queda más remedio que enfrentarse a él, comprenderlo y, tal vez, ganarle la partida.\r\nPero un día, en una librería de segunda mano de Manhattan, Addie conoce a alguien que pone su mundo del revés... Por primera vez, alguien la recuerda.\r\n¿Será este el punto final de la vida de Addie LaRue? ¿O tan solo serán puntos suspensivos?', '2020-12-06 11:30:24', '2020-12-06 11:30:24'),
(2, 2, 'El club del crimen de los Jueves', 180, '123656-6565-5656', '2020-12-05', 'uploads/images/covers/1607232786.jpg', 'En un pacífico complejo privado para jubilados, cuatro improbables amigos se reúnen una vez a la semana para revisar antiguos casos de asesinatos locales que quedaron sin resolver. Ellos son Ron, un exactivista socialista lleno de tatuajes y revolución; la dulce Joyce, una viuda que no es tan ingenua como aparenta; Ibrahim, un antiguo psiquiatra con una increíble capacidad de análisis, y la tremenda y enigmática Elizabeth, que, a sus 81 años, lidera el grupo de investigadores aficionados… o no tanto.\r\n\r\nCuando un promotor inmobiliario de la zona es hallado muerto con una misteriosa fotografía junto al cuerpo, El Club del Crimen de los Jueves se encuentra en medio de su primer caso real. Aunque sean octogenarios, los cuatro amigos guardan algunos trucos en la manga.', '2020-12-06 11:33:06', '2020-12-06 11:33:06'),
(3, 3, 'La leyenda de la peregrina', 180, '123656-6565-5656', '2020-12-05', 'uploads/images/covers/1607232943.jpg', 'La Peregrina es, sin duda, la perla sino más extraordinaria, más famosa de todos los tiempos. Procedente de las aguas del mar Caribe, fue entregada a Felipe II y desde entonces se convirtió en una de las joyas principales de la monarquía hispánica. Pasó por herencia por el joyero de varias reinas hasta que, después de la Guerra de la Independencia, fue llevada a Francia.\r\n\r\nEn ese momento comenzó la segunda vida de la Peregrina, cuyo momento culminante fue cuando, ya en el siglo XX, Richard Burton se la regaló en prenda de amor a otra mujer de leyenda: la inmensa actriz Elizabeth Taylor.\r\n\r\nConfesando su inspiración a partir del clásico contemporáneo El escarabajo de Mújica Laínez, Carmen Posadas escoge como protagonista de su nuevo proyecto a un objeto destinado a pasar de mano a mano y a tener una trayectoria azarosa, aventurera y, sin lugar a dudas, digna de la gran novela que el lector tiene en sus manos.', '2020-12-06 11:35:43', '2020-12-06 11:35:43'),
(4, 4, 'Dime quién soy', 180, '123656-6565-5656', '2020-12-05', 'uploads/images/covers/1607233084.jpg', 'Un periodista recibe la propuesta de investigar la vida de su bisabuela, Amelia Garayoa, una mujer de la que sólo sabe que huyó abandonando a su marido y a su hijo poco antes de que estallara la guerra civil española. Para rescatarla del olvido deberá reconstruir su historia desde los cimientos encajando, una a una, todas las piezas del inmenso y extraordinario puzle de su vida.\r\n\r\nMarcada por cuatro hombres que la cambiarán para siempre -el empresario Santiago Carranza, el revolucionario francés Pierre Comte, el periodista estadounidense Albert James y el médico militar vinculado al nazismo Max von Schumann-, la historia de Amelia es la de una antiheroína presa de sus propias contradicciones que cometerá errores que no terminará nunca de pagar y que acabará sufriendo, en carne propia, el azote despiadado tanto del nazismo como de la dictadura soviética.', '2020-12-06 11:38:04', '2020-12-06 11:38:04'),
(5, 5, 'La suerte del enano', 180, '123656-6565-5656', '2020-12-05', 'uploads/images/covers/1607233240.jpg', 'Valladolid, 2019. Sara Robles es una inspectora singular. Encargada de resolver un macabro crimen, además tiene que lidiar con sus problemas cotidianos, estrechamente relacionados con la adicción al sexo y con un pasado que no termina de curar. Mientras tanto, El Espantapájaros, una misteriosa cabeza pensante, ha orquestado el robo perfecto junto a un exminero, un pocero y un sicario, y está a punto de llevarlo a cabo a través del alcantarillado de la ciudad.\r\n\r\nLa suerte del enano es una brillante novela con altas dosis de investigación policial, sexo y violencia en la que el lector profundizará en el complejo mundo de los robos de obras de arte y sus extensas ramificaciones que los relacionan con grupos de delincuencia organizada.\r\n\r\nGellidismo extremo en estado puro.', '2020-12-06 11:40:40', '2020-12-06 11:40:40'),
(6, 1, 'Todo lo que somos tú y tú y yo', 180, '123656-6565-5656', '2020-12-05', 'uploads/images/covers/1607233402.jpg', 'Gala y Olivia llevan ocho años juntas y su vida transcurre por los apacibles senderos de una relación de pareja plena y feliz. Ambas trabajan en la empresa creada por ellas, se quieren, se desean, se complementan a la perfección y sostienen que cada una es todo lo que la otra necesita… Y, sin embargo, y de la manera más inesperada, cuando una extraña, Stella, irrumpe en sus vidas esos cimientos que creían tan sólidos comienzan a tambalearse llevándolas a replantearse todas las normas establecidas entre ambas, hasta el punto de que ya nada volverá a ser igual entre ellas. A través de una arquitectura narrativa original, audaz y sorprendente, que nos permitirá sumergirnos en los secretos, deseos y dilemas de cada una de las protagonistas, Todo lo que somos tú y tú y yo aborda, con una prosa directa, sincera y actual, el reto, la excitación e inseguridades que, como una montaña rusa de novedades y dudas, embargan a quienes se embarcan en un modelo de relación fuera de lo convencional.', '2020-12-06 11:43:22', '2020-12-06 11:43:22'),
(7, 1, 'Cicatríz', 180, '123656-6565-5656', '2020-12-05', 'uploads/images/covers/1607279959.jpg', 'Simon Sax podría ser un tipo afortunado. Es joven, listo y está punto de convertirse en multimillonario si vende su gran invento -un asombroso algoritmo- a una multinacional. Y, sin embargo, se siente solo. Su éxito contrasta con sus nulas habilidades sociales.\r\n\r\nHasta que un día vence sus prejuicios y entra en una web de contactos donde se enamora perdidamente de Irina, con la inexperiencia y la pasión de un adolescente, a pesar de los miles de kilómetros que los separan.', '2020-12-07 00:39:19', '2020-12-07 00:39:19'),
(8, 1, 'Adiós al frío', 180, '123656-6565-5656', '2020-12-06', 'uploads/images/covers/1607280199.jpg', 'CON apenas 20 años, Elvira Sastre (Segovia, 1992) publicó su primer libro de poemas, Cuarenta y tres maneras de soltarse el pelo, después Baluarte, Ya nadie baila y La soledad de un cuerpo acostumbrado a la herida. Con su novela Días sin ti ganó en 2019 el Premio Biblioteca Breve. «Elvira Sastre es poeta, y el oficio de los poetas supone un esfuerzo por entender la vida. En sus primeras versiones, este libro trabajado se iba a titular La razón de los lamentos. No escribe aquí sobre los lamentos de la razón, las quejas de la luz por la existencia del mal y de las sombras. Escribe sobre la razón de los lamentos, sobre las huellas de la vida que necesitamos entender para tomar conciencia de lo que somos y de lo que ya no somos. Es la necesidad de decir, de decirse, de contarlo, de permanecer en una voz. Pero también el deseo de escuchar la nieve o el mar, la manera de habitar en dos orillas, de meditar el dolor y el amor, las heridas que no se ven y aquello que nos hace felices sin que sepamos nombrarlo. Una poesía hecha de insistencia, una poeta que quiere llegar hasta los huesos, como nos enseñó César Vallejo. Una lucidez que no oculta la razón de los lamentos, pero que enumera e insiste en una voluntaria fe de vida.', '2020-12-07 00:43:19', '2020-12-07 00:43:19'),
(9, 1, 'Las cosas que importan', 180, '123656-6565-5656', '2020-12-06', 'uploads/images/covers/1607280312.jpg', 'Este libro es para que vivas, crees y digas lo que sientes.\r\n\r\nPara que viajes por ese universo donde los sueños pueden hacerse realidad.\r\n\r\nEste libro es sobre las cosas que importan.\r\n\r\nY, sobre todo, sobre las cosas que te importan a ti.', '2020-12-07 00:45:12', '2020-12-07 00:45:12'),
(10, 1, 'Cómo el Grinch se robó la navidad', 180, '123656-6565-5656', '2020-12-06', 'uploads/images/covers/1607280539.jpg', '¡Cómo el Grinch robó la Navidad!, de Dr. Seuss es todo un clásico de la Navidad, una lectura infantil imprescindible que abarca un rango muy amplio de edades, conquistando incluso a los adultos. Es más, te voy a confesar que es mi libro infantil favorito de Navidad ¡y mira que hemos leído libros!\r\n\r\nEste es mi debilidad.\r\n\r\nNarra una historia trepidante y llena de tensión que concluye con un final aleccionador y muy emotivo. Es difícil no echar una lagrimita al concluir.', '2020-12-07 00:48:59', '2020-12-07 00:48:59'),
(11, 6, 'Decimo tercer viaja: Las siete pruebas del reino de las fantasías', 180, '123656-6565-5656', '2020-12-06', 'uploads/images/covers/1607280830.jpg', '¡Una antigua profecía, una princesa rebelde y una legendaria corona que rescatar!\r\nEn otro tiempo existía una magnífica, inmensa y mítica tierra: el Imperio de la Fantasía. Pero un mago malvado se hizo con el poder y la transformóen un reino gris y desolado. Ahora, un grupo de héroes, guiados por la princesa Alina y un valeroso caballero, tiene una gran misión: ¡encontrar la corona y hacer revivir el antiguo imperio!', '2020-12-07 00:53:50', '2020-12-07 00:53:50'),
(12, 2, 'El libro de Gianni Rodari', 180, '123656-6565-5656', '2020-12-07', 'uploads/images/covers/1607281074.jpg', 'Blackie Books celebra el centenario del nacimiento del gran Gianni Rodari, uno de los mejores autores para niños y pedagogos de todos los tiempos. Para ello recopilamos en un mismo volumen sus mejores cuentos, sus poemas más conocidos, 20 nuevos relatos contando su vida, y una serie de páginas especiales para explicar su concepto de fantasía, de educación, de escuela, de infancia, de lectura. Una edición de coleccionista, enteramente ilustrada por Marta Altés, que servirá de libro de cabecera a pequeños y mayores.', '2020-12-07 00:57:54', '2020-12-07 00:57:54'),
(13, 1, 'DUNE', 100, '12121-6565-2121', '2020-12-07', 'uploads/images/covers/1607918727.jpg', 'Arrakis: un planeta desértico donde el agua es el bien más preciado donde llorar a los muertos es el símbolo de máxima prodigalidad. Paul Atreides: un adolescente marcado por un destino singular, dotado de extraños poderes, abocado a convertirse en dictador, mesías y mártir. Los Harkonnen: personificación de las intrigas que rodean el Imperio Galáctico, buscan obtener el control sobre Arrakis para disponer de la melange, preciosa especia y uno de los bienes más codiciados del universo. Los Fremen: seres libre que han convertido el inhóspito paraje de Dune en su hogar, y que se sienten orgullosos de su pasado y temerosos de su futuro. Dune: una obra maestra unánimemente reconocida como la mejor saga de ciencia ficción de todos los tiempos.', '2020-12-14 10:05:27', '2020-12-14 10:05:27'),
(14, 1, 'Guerra Mundial Z', 100, '12121-6565-2121', '2020-12-01', 'uploads/images/covers/1607918982.jpg', 'El autor ha dedicado varios años a recorrer el mundo en busca de todos los testimonios que ahora reúne aquí sobre la guerra mundial zombi. Por insólito que parezca este libro, que algunos tildan de novela demasiado realista, es la parte censurada del informe que le encargó Naciones Unidas para que quedara memoria de \"La Crisis\", los \"Años Oscuros\" o la \"Plaga Andante\", principalmente conocida como Guerra Mundial Z. Al parecer había \"demasiado factor humano\". Este libro aclara realmente cómo el doctor Kwang Jingshu descubrió los primeros casos y se destaparon las pruebas ocultadas por el gobierno chino sobre el gran estallido. También cómo surgió y se propagó el controvertido Plan Naranja de supervivencia, fruto de un oscuro cerebro del apartheid sudafricano. Además contiene los testimonios directos de gentes de la posguerra: contrabandistas de Tíbet, oficiales de servicios secretos de medio mundo, militares, científicos, industriales, políticos, ecologistas, supermodelos, gentes de culturas alternativas tras el cataclismo y muchos otros que lucharon para defendernos de la amenaza de los zombis. También de aquellos que no lo hicieron tanto e incluso de aquellos que creen que la lucha continúa. Por fin, el mundo sabrá la historia verdadera de cómo la humanidad estuvo a punto de extinguirse. Desde el fin oficial de hostilidades se han producido numerosas tentativas para documentar la guerra zombi.', '2020-12-14 10:09:42', '2020-12-14 10:09:42'),
(15, 1, 'El nombre del viento', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607919288.jpg', 'En una posada en tierra de nadie, un hombre se dispone a relatar, por primera vez, la auténtica historia de su vida. Una historia que únicamente él conoce y que ha quedado diluida tras los rumores, las conjeturas y los cuentos de taberna que le han convertido en un personaje legendario a quien todos daban ya por muerto: Kvothe# músico, mendigo, ladrón, estudiante, mago, héroe y asesino. Ahora va a revelar la verdad sobre sí mismo. Y para ello debe empezar por el principio: su infancia en una troupe de artistas itinerantes, los años malviviendo como un ladronzuelo en las calles de una gran ciudad y su llegada a una universidad donde esperaba encontrar todas las respuestas que había estado buscando. «Viajé, amé, perdí, confié y me traicionaron.» «He robado princesas a reyes agónicos. Incendié la ciudad de Trebon. He pasado la noche con Felurian y he despertado vivo y cuerdo. Me expulsaron de la Universidad a una edad a la que a la mayoría todavía no los dejan entrar. He recorrido de noche caminos de los que otros no se atreven a hablar ni siquiera de día. He hablado con dioses, he amado a mujeres y he escrito canciones que hacen llorar a los bardos. »Me llamo Kvothe. Quizá hayas oído hablar de mí.»', '2020-12-14 10:14:48', '2020-12-14 10:14:48'),
(16, 1, 'El marciano', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607919506.jpg', 'Hace seis dias, el astronauta Mark Watney se convirtió en una de las primeras personas en caminar por Marte. Ahora, está seguro de que va a ser la primera persona en morir allí. Después de que una tormenta de polvo casi acabase con él y oblige a su tripulacion a evacuar dándolo por muerto, Mark se encuentra atrapado y completamente solo, sin manera de enviar una señal a la tierra de que está vivo, y aunque pudiera conseguir comunicarse, sus suministros se acabarían mucho antes de que el rescate llegase.', '2020-12-14 10:18:26', '2020-12-14 10:18:26'),
(17, 1, 'Las 150 vidas de Horacio Echevarrieta', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607919900.png', 'El empresario que creó un emporio económico sustentado en la innovación y en la generación de un progreso que ha llegado hasta nuestros días. Superó adversidades y sobrevivió a crisis, guerras y pandemias con un espíritu constructivo y resiliente. Influyó en la política nacional e internacional y acabó devorado por ella. Promovió imponentes obras de ingeniería y arquitectura e impulsó grandes avances en el mundo del arte, el deporte, el pensamiento y el progreso social. Se pueden contar con los dedos de la mano los personajes comparables en los últimos 150 años de la historia de España. Y a pesar de ello, su figura permanece en un casi unánime olvido, que dice muy poco en favor de nuestra sociedad.', '2020-12-14 10:25:00', '2020-12-14 10:25:00'),
(18, 1, 'Mientras Escribo', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607920142.jpg', 'Una obra insólita y peculiar en la producción del maestro del terror contemporáneo. Por esta vez, Stephen King abandona su escalofriante universo literario para centrarse en su propia persona. Autobiografía selectiva de su infancia y juventud, al tiempo que lúcido ensayo sobre el arte de narrar buenas historias, Mientras escribo satisfará la curiosidad de todos sus lectores por conocer las facetas privadas del autor y sus opiniones y puntos de vista acerca de la literatura, centrándose muy especialmente en todos los trucos, claves y secretos que debe dominar un novelista para atrapar el interés del lector.', '2020-12-14 10:29:02', '2020-12-14 10:29:02'),
(19, 1, 'Misery', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607920357.jpg', 'Misery es un relato obsesivo que sólo podía escribir Stephen King. Un escritor sufre un grave accidente y recobra el conocimiento en una apartada casa en la que vive una misteriosa mujer, corpulenta y de extraño carácter. Se trata de una antigua enfermera, involucrada en varias muertes misteriosas ocurridas en diversos hospitales. Esta mujer es capaz de los mayores horrores, y el escritor, con las piernas rotas y entre terribles dolores, tiene que luchar por su vida.', '2020-12-14 10:32:37', '2020-12-14 10:32:37'),
(20, 1, 'La milla verde', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607920565.jpg', 'Octubre de 1932, penitenciaría de Cold Mountain. Los condenados a muerte aguardan el momento de ser conducidos a la silla eléctrica. Los crímenes abominables que han cometido les convierten en carnaza de un sistema legal que se alimenta de un círculo de locura, muerte y venganza. Y en esa antesala del infierno Stephen King traza una pavorosa radiografía del horror en estado puro.', '2020-12-14 10:36:05', '2020-12-14 10:36:05'),
(21, 1, 'Sherlock Holmes: El signo de los cuatro', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607921164.jpg', 'Pocas veces en la historia de la literatura un personaje de ficción alcanza tal celebridad que incluso oscurece la figura de su propio creador. El caso de Sherlock Holmes es uno de los más representativos. Segunda novela de las cuatro protagonizadas por el brillante detective, El signo de los cuatro gira en torno a los avatares de un fabuloso tesoro en la India colonial, y en sus páginas se consolidan los sugerentes y pintorescos rasgos de la singular personalidad del investigador. En El sabueso de los Baskerville, Holmes, trasladado a los inhóspitos y desolados páramos de la región de Dartmoor, se enfrenta al reto de resolver un enigmático crimen relacionado con el espectro de un perro diabólico y sobrenatural, instrumento de la maldición que pesa sobre una familia.', '2020-12-14 10:46:04', '2020-12-14 10:46:04'),
(22, 1, 'Vestido de novia', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607921705.jpg', 'Sophie Duguet, la protagonista de esta novela, no entiende qué le sucede: pierde objetos, olvida situaciones y es detenida en un supermercado por pequeños robos que no recuerda haber cometido. Y los cadáveres comienzan a acumularse a su alrededor…', '2020-12-14 10:55:05', '2020-12-14 10:55:05'),
(23, 1, 'Tres días y una vida', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607921921.jpg', 'En la historia de la literatura abundan los ejemplos de personajes cuyas vidas se ven irremediablemente afectadas por un breve instante de su pasado. En esta nueva novela que sucede a Nos vemos allá arriba —Premio Goncourt y notable éxito de ventas en castellano—, Pierre Lemaitre retrata con mano maestra la trayectoria vital de un adolescente que, en un fugaz e impremeditado arranque de ira, se ve envuelto en un crimen y debe cargar con el horror y la culpa por el resto de sus días. El relato, dividido en tres momentos espaciados en el tiempo —1999, 2011 y 2015—, es una invitación a acompañar el fascinante proceso de formación de la psique de Antoine Courtin, durante el cual se vislumbra el lacerante destino de una persona que, paradójicamente, ha sido víctima de su propia culpabilidad. Todo comienza en Beauval, un pequeño pueblo enclavado en una región cubierta de bosques, donde la apacibilidad y belleza del lugar son el contrapunto perfecto a la sucesión de acontecimientos que conforman la trama. Al complejo microcosmos de sus habitantes, no exentos de hipocresía y cinismo, se añaden los ambiguos gestos, los comentarios maliciosos, la maldad y la insidia parapetadas detrás de las buenas intenciones, elementos todos ellos determinantes en la gestación y desenlace de la apasionante historia de Antoine Courtin.', '2020-12-14 10:58:41', '2020-12-14 10:58:41'),
(24, 1, 'Palmeras en la nieva', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607922251.jpg', 'Es 1953 y Kilian abandona la nieve de la montaña oscense para iniciar junto a su hermano, Jacobo, el viaje de ida hacia una tierra desconocida, lejana y exótica, la isla de Fernando Poo. En las entrañas de este territorio exuberante y seductor, le espera su padre, un veterano de la finca Sampaka, el lugar donde se cultiva y tuesta uno de los mejores cacaos del mundo. En esa tierra eternamente verde, cálida y voluptuosa, los jóvenes hermanos descubren la ligereza de la vida social de la colonia en comparación con una España encorsetada y gris, comparten el duro trabajo necesario para conseguir el cacao perfecto de la finca Sampaka, aprenden las diferencias y similitudes culturales entre coloniales y autóctonos, y conocen el significado de la amistad, la pasión, el amor y el odio. Pero uno de ellos cruzará una línea prohibida e invisible y se enamorará perdidamente de una nativa. Su amor por ella, enmarcado en unas complejas circunstancias históricas, y el especial vínculo que se crea entre el colono y los oriundos de la isla transformarán la relación de los hermanos, cambiarán el curso de sus vidas y serán el origen de un secreto cuyas consecuencias alcanzarán el presente. En el año 2003, Clarence, hija y sobrina de ese par de hermanos, llevada por la curiosidad del que desea conocer sus orígenes, se zambulle en el ruinoso pasado que habitaron Kilian y Jacobo y descubre los hilos polvorientos de ese secreto que finalmente será desentrañado. Un excelente relato que recupera nuestras raíces coloniales y una extraordinaria y conmovedora historia de amor prohibido con resonancias de Memorias de áfrica.', '2020-12-14 11:04:11', '2020-12-14 11:04:11'),
(25, 1, 'Regreso a tu piel', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607922415.jpg', 'Brianda de Lubich, única heredera del señor más importante del condado de Orrun, ve como el mundo a su alrededor se desmorona tras la muerte de su progenitor. En una tierra convulsionada por las guerras, en la que ella y otras veintitrés mujeres serán acusadas de brujería, solo podrá aferrarse a un hombre: aquel a quien juró amar más allá de la muerte. El desenlace de esta historia de amor inquebrantable llegará siglos después, cuando una joven ingeniera comience a recuperar fragmentos de un mundo pretérito y a sentir un amor irracional hacia un extranjero llegado a un recóndito lugar de las montañas para reconstruir la mansión familiar heredada de sus ancestros. Los impenetrables paisajes que separan la Francia y la España del siglo XVI albergan una historia única de lucha, amor y justicia.', '2020-12-14 11:06:55', '2020-12-14 11:06:55'),
(26, 1, 'Como fuego en el hielo', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607922871.jpg', 'El fatídico día en el que Attua tuvo que ocupar el lugar de su padre supo que su prometedor futuro se había truncado. Ahora debía regentar las termas que habían sido el sustento de su familia, en una tierra fronteriza a la que él nunca hubiera elegido regresar. Junto al suyo, también se frustró el deseo de Cristela, quien anhelaba una vida a su lado y, además, alejarse de su insoportable rutina en un entorno hostil. Un nuevo revés del destino pondrá a prueba el irrefrenable amor entre ellos; y así, entre malentendidos y obligaciones, decisiones y obsesiones, traiciones y lealtades, Luz Gabás teje una bella historia de amor, honor y superación. Los convulsos años de mediados del siglo xix, entre guerras carlistas y revoluciones; la construcción de un sueño en las indomables montañas que separan Francia y España; y una historia de amor que traspasa todas las barreras. Una novela escrita con el apasionante pulso narrativo de la autora de Palmeras en la nieve.', '2020-12-14 11:14:31', '2020-12-14 11:14:31'),
(27, 1, 'La sonrisa etrusca', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607923105.jpg', 'Un viejo campesino calabrés llega a casa de sus hijos en Milán para someterse a una revisión médica. Allí descubre su último afecto, una criatura en la que volcar toda su ternura: su nieto, que se llama Bruno, como a él le llaman sus camaradas partisanos. Y vive también su última pasión: el amor de una mujer que iluminará la etapa final de su vida concediéndole toda su plenitud...', '2020-12-14 11:18:25', '2020-12-14 11:18:25'),
(28, 1, 'El caballo desnudo', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607923223.jpg', '\"En la pequeña ciudad de Villabruna,... encerrada en sus rancias tradiciones y en su sórdido provincianismo, se produce un notable revuelo y las almas pías se disponen a una cruzada en favor de la decencia. El motivo es muy sencillo: una mañana en la alameda, un niño llamado Adolfito ha dicho a su tía doña Evangelios ¡Tía, mira, ese caballo va desnudo!. A partir de ahí se produce el revuelo, que llevará a la fundación de la Liga para la Moral Animal, cuyo fin es defender los valores espirituales de la sociedad villabrunense, amenazada por el Enemigo Malo...\" Bajo la apariencia de una historia teñida de humor e ironía, esta novela reconstruye la vida de una ciudad provinciana que, a su vez, reproduce microscópicamente el macrocosmos de la España de la Restauración, aquella España fantasmagórica ya a punto de fenecer en ese mismo año de 1917.', '2020-12-14 11:20:23', '2020-12-14 11:20:23'),
(29, 1, 'Congreso en Estocolmo', 100, '12121-6565-2121', '2020-12-06', 'uploads/images/covers/1607923324.jpg', 'Con los pormenores de una reunión científica como telón de fondo, Congreso en Estocolmo narra el encuentro amoroso entre dos personas de culturas, edades y actitudes diferentes. José Luis Sampedro plasma una delicada trama de pasiones tamizadas por la tenue melancolía del paisaje nórdico y propone una fervorosa aceptación del vivir en su múltiple riqueza y en su desgarradora intensidad. Fruto de su viaje a Suecia y de su descubrimiento personal del Báltico, el autor crea una de las más interesantes novelas de la actual narrativa española.\r\n\r\nOtros libros del autor', '2020-12-14 11:22:04', '2020-12-14 11:22:04'),
(30, 1, 'Monte Sinaí', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607923444.jpg', 'Con tono poético y tenuemente melancólico, Monte Sinaí narra el período que el autor pasó en un hospital neoyorquino a causa de una dolencia cardíaca. Una obra de lenguaje vivo y sutil que reflexiona sobre la fragilidad de la condición humana y la cercana proximidad de la muerte, sin caer en el pesimismo y la afectación, antes bien con un mensaje optimista que permite conocer la trayectoria vital más reciente de José Luis Sampedro.', '2020-12-14 11:24:04', '2020-12-14 11:24:04'),
(31, 1, 'La genealogía de la moral', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607923650.jpg', 'La genealogía de la moral es la obra más sombría y cruel de Friedrich Nietzsche. Su primer tratado se ocupa de la contraposición entre los conceptos de \"bueno\" y \"malo\", así como de la posterior transformación de su significado por obra de la interpretación judeo-cristiana. El segundo tratado analiza la mala conciencia, cuya causa en épocas primitivas era la culpa entendida no en el sentido de responsabilidad moral, sino como equivalente a deuda material. La última parte, que anuncia el nuevo ideal del superhombre, analiza el significado del ascetismo.', '2020-12-14 11:27:30', '2020-12-14 11:27:30'),
(32, 1, 'El discurso del método0', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607923823.jpg', 'El Discurso, texto eminentemente filosófico, marca el punto de ruptura con el mundo conceptual del medievo, dominado por la escolástica. Al mismo tiempo, y junto a su valor fundamental, es también una crónica del pensamiento, un libro de memorias, una elaboración científica en la que el investigador pasa a primer plano, a la primera persona. Así reconocemos, a la par que la obra que funda los cimientos del mundo moderno, un minucioso retrato de su creador: René Descartes.', '2020-12-14 11:30:23', '2020-12-14 11:30:23'),
(33, 1, 'Sapiens: De animales a Dioses', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607924335.jpg', '¿Cómo logró nuestra especie imponerse en la lucha por la existencia? ¿Por qué nuestros ancestros recolectores se unieron para crear ciudades y reinos? ¿Cómo llegamos a creer en dioses, en naciones o en los derechos humanos; a confiar en el dinero, en los libros o en las leyes? ¿Cómo acabamos sometidos a la burocracia, a los horarios y al consumismo? ¿Y cómo será el mundo en los milenios venideros? En De animales a dioses, Yuval Noah Harari traza una breve historia de la humanidad, desde los primeros humanos que caminaron sobre la Tierra hasta los radicales y a veces devastadores avances de las tres grandes revoluciones que nuestra especie ha protagonizado: la cognitiva, la agrícola y la científica. A partir de hallazgos de disciplinas tan diversas como la biología, la antropología, la paleontología o la economía, Harari explora cómo las grandes corrientes de la historia han modelado nuestra sociedad, los animales y las plantas que nos rodean e incluso nuestras personalidades. ¿Hemos ganado en felicidad a medida que ha avanzado la historia? ¿Seremos capaces de liberar alguna vez nuestra conducta de la herencia del pasado? ¿Podemos hacer algo para influir en los siglos futuros? Audaz, ambicioso y provocador, este libro cuestiona todo lo que creíamos saber sobre el ser humano: nuestros orígenes, nuestras ideas, nuestras acciones, nuestro poder... y nuestro futuro.', '2020-12-14 11:38:55', '2020-12-14 11:38:55'),
(34, 1, 'Operaciones especiales en la edad de la caballería', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607924562.jpg', 'Además de las conocidas batallas campales, los asedios regulares y las maniobras a gran escala, las guerras medievales y de principios de la época moderna también incluían asesinatos, secuestros, traiciones y sabotajes. Estas operaciones encubiertas o especiales se dirigieron principalmente contra personas clave —principalmente la realeza o los líderes del ejército enemigo—, y contra castillos o lugares estratégicos fortificados, incluidos puentes, molinos y presas. Sin embargo, debido a su naturaleza clandestina, estas acciones de «provocación» nunca se han estudiado en detalle. Esta obra de Yuval Hoah Harari viene a rellenar esta importante laguna. Examina en primer lugar una amplia variedad de operaciones especiales, desde el siglo XI hasta el XVI. Tras este repaso, el proferor Harari, se centra en analizar con mayor profundidad seis selectas y emocionantes operaciones: la traición de Antioquía en 1098; el intento de rescatar al rey Balduino II de la mazmorra de Khartpert en 1123; el asesinato de Conrad de Montferrat en 1192; el intento de asaltar Calais en 1350; la «guerra sucia» emprendida por los gobernantes de Francia y Borgoña en las décadas de 1460 y 1470 y la demolición del molino harinero de Auriol en 1536.', '2020-12-14 11:42:42', '2020-12-14 11:42:42'),
(35, 1, 'Mortadelo y Filemón', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607924796.jpg', 'Las mejores aventuras de Mortadelo y Filemón seleccionadas por Ibáñez. En 1969, debido al éxito creciente de la serie Mortadelo y Filemón, la editorial Bruguera encargó a Ibáñez la primera aventura larga de los famosos agentes. Francisco Ibáñez creó una historieta con un cuidadísimo dibujo y guion, que pasaría a la historia de nuestro cómic, siendo considerada por muchos como la obra cumbre de Ibáñez. Con más de cincuenta años desde su publicación, El sulfato atómico es un icono y una de las obras maestras del cómic, reconocida internacionalmente.', '2020-12-14 11:46:36', '2020-12-14 11:46:36'),
(36, 1, 'V de Vendetta', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607925267.jpg', 'Estamos en el año 1997. Ha finalizado la III Guerra Mundial. Inglaterra se ha convertido en un estado fascista. En estos tiempos de desesperación y oscuridad, aparece un misterioso individuo que se hace llamar \"V\" y que ataca a los intereses y agentes del estado, creando el caos. Pero, ¿quién es \"V\"? ¿Por qué busca venganza? La respuesta la conoceremos gracias a Evey, una joven de 16 años que se vió obligada a prostituirse para seguir adelante y que fue rescatada por el misterioso \"V\" de ser violada y asesinada por los mal llamados \"agentes del orden\" del estado. Tomada por \"V\" bajo su \"cuidado\" (que en ocasiones más bien parece un cautiverio), mediante la interacción de ambos personajes se nos irá desvelando poco a poco el pasado y objetivos del misterioso protagonista de la historia mientras lleva a cabo su cruzada contra el estado y vamos conociendo mejor este hipotético futuro.', '2020-12-14 11:54:27', '2020-12-14 11:54:27'),
(37, 1, 'Spin Nulo', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607925454.jpg', '¿Puede un instante abarcar varios universos?\r\n\r\nCERN, Ginebra, 2021. En el acelerador de partículas más grande del mundo, el excéntrico Herman Hahn lidera un experimento que podría cambiar nuestra concepción del universo. Tras varios meses sin encontrar resultados, deberá coordinar un equipo de científicos de primer nivel entre los que se encuentra el joven Ian Blom, un físico brillante que abandona París, sin su novia Corina, para incorporarse al proyecto.\r\n\r\n¿Pueden convivir varias realidades a la vez?\r\n\r\nBajo una gran presión mediática y el escrutinio de la comunidad científica, Ian y Herman pronto se dan cuenta de que no son los únicos que tienen acceso al acelerador. Alguien está saboteando el experimento, y el equipo tendrá que enfrentarse a unas conclusiones que la ciencia puede explicar pero la lógica no. La cuenta atrás, o adelante, ha empezado.', '2020-12-14 11:57:34', '2020-12-14 11:57:34'),
(38, 1, 'El guardián invisible', 100, '12121-6565-2121', '2020-12-13', 'uploads/images/covers/1607925630.jpg', '«Ainhoa Elizasu fue la segunda víctima del basajaun, aunque entonces la prensa todavía no lo llamaba así. Fue un poco más tarde cuando trascendió que alrededor de los cadáveres aparecían pelos de animal, restos de piel y rastros dudosamente humanos, unidos a una especie de fúnebre ceremonia de purificación. Una fuerza maligna, telúrica y ancestral parecía haber marcado los cuerpos de aquellas casi niñas con la ropa rasgada, el vello púbico rasurado y las manos dispuestas en actitud virginal.» En los márgenes del río Baztán, en el valle de Navarra, aparece el cuerpo desnudo de una adolescente en unas circunstancias que lo ponen en relación con un asesinato ocurrido en los alrededores un mes atrás. La inspectora de la sección de homicidios de la Policía Foral, Amaia Salazar, será la encargada de dirigir una investigación que la llevará devuelta a Elizondo, una pequeña población de donde es originaria y de la que ha tratado de huir toda su vida. Enfrentada con las cada vez más complicadas derivaciones del caso y con sus propios fantasmas familiares, la investigación de Amaia es una carrera contrarreloj para dar con un asesino que puede mostrar el rostro más aterrador de una realidad brutal al tiempo que convocar a los seres más inquietantes de las leyendas del Norte.', '2020-12-14 12:00:30', '2020-12-14 12:00:30'),
(39, 1, 'Legado en los huesos', 100, '12121-6565-2121', '2020-12-14', 'uploads/images/covers/1607925782.jpg', 'El juicio contra el padrastro de la joven Johana Márquez está a punto de comenzar. A él asiste una embarazada Amaia Salazar, la inspectora de la policía foral que un año atrás había resuelto los crímenes del llamado basajaun, que sembraron de terror el valle del Baztán. Amaia también había reunido las pruebas inculpatorias contra Jasón Medina, que imitando el modus operandi del basajaun había asesinado, violado y mutilado a Johana, la adolescente hija de su mujer. De pronto, el juez anuncia que el juicio debe cancelarse: el acusado acaba de suicidarse en los baños del juzgado. Ante la expectación y el enfado que la noticia provoca entre los asistentes, Amaia es reclamada por la policía: el acusado ha dejado una nota suicida dirigida a la inspectora, una nota que contiene un escueto e inquietante mensaje: «Tarttalo». Con una sola palabra, se destapará una trama sobrecogedora que envuelve a la inspectora hasta un trepidante final. Segunda parte de la Trilogía del Baztán.', '2020-12-14 12:03:02', '2020-12-14 12:03:02'),
(40, 1, 'Todo esto te daré', 100, '12121-6565-2121', '2020-12-14', 'uploads/images/covers/1607925946.jpg', 'En el escenario majestuoso de la Ribeira Sacra, Álvaro sufre un accidente que acabará con su vida. Cuando Manuel, su marido, llega a Galicia para reconocer el cadáver, descubre que la investigación sobre el caso se ha cerrado con demasiada rapidez. El rechazo de su poderosa familia política, los Muñiz de Dávila, le impulsa a huir pero le retiene el alegato contra la impunidad que Nogueira, un guardia civil jubilado, esgrime contra la familia de Álvaro, nobles mecidos en sus privilegios, y la sospecha de que ésa no es la primera muerte de su entorno que se ha enmascarado como accidental. Lucas, un sacerdote amigo de la infancia de Álvaro, se une a Manuel y a Nogueira en la reconstrucción de la vida secreta de quien creían conocer bien. La inesperada amistad de estos tres hombres sin ninguna afinidad aparente ayuda a Manuel a navegar entre el amor por quien fue su marido y el tormento de haber vivido de espaldas a la realidad, blindado tras la quimera de su mundo de escritor. Empezará así la búsqueda de la verdad, en un lugar de fuertes creencias y arraigadas costumbres en el que la lógica nunca termina de atar todos los cabos.', '2020-12-14 12:05:46', '2020-12-14 12:05:46'),
(41, 1, 'La voz dormida', 100, '12121-6565-2121', '2020-12-14', 'uploads/images/covers/1607926176.jpg', 'Unas en la retaguardia, otras en la vanguardia armada de la guerrilla; unas desde fuera, y otras tras los muros de la prisión madrileña de Ventas; todas mujeres, todas valientes y sacrificadas... Una historia de coraje y dignidad que se convierte en testimonio y homenaje al papel desempeñado por muchas mujeres en los momentos decisivos de la guerra civil española y en los siguientes años de represión... Un estilo inolvidable, unos personajes que dejan huella... Esta novela ha sido llevada al cine en 2011 en la película dirigida por Benito Zambrano con Inma Cuesta, Marc Clotet, María León, y Daniel Holguín como protagonistas principales.', '2020-12-14 12:09:36', '2020-12-14 12:09:36'),
(42, 1, 'Diario de una mujer muerta y otros cuentos', 100, '12121-6565-2121', '2020-12-14', 'uploads/images/covers/1607926406.jpg', 'Escondida entre los arcos de piedra de la plaza Mayor de Badajoz, una joven gitana observa con ojos de gato al hombre para quien bailará alrededor del fuego cuando caiga la noche. En ese mismo instante, la urna con las cenizas de un generoso millonario resbala de entre los frágiles dedos de una mujer, hundiéndose en el mar cristalino de las Islas Morrocoy. Poco después una mujer escribirá en su diario que el hombre de ojos grises con quien duerme la quemará viva cuando vuelva a casa; y en el vagón de un tren sin destino Marcel se petrifica ante la belleza rubia que se dirige hacia él, con un vestido de seda azul.Con imaginación desbordante, un lenguaje evocador y grandes dosis de talento y sensibilidad, la autora de Cielos de barro y La voz dormida recorre sin tapujos los temas que siempre han estado presentes en su universo literario: el amor, el dolor, la vulnerabilidad, el desengaño, la esperanza o la fantasía', '2020-12-14 12:13:26', '2020-12-14 12:13:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_authors`
--

CREATE TABLE `book_authors` (
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `book_authors`
--

INSERT INTO `book_authors` (`book_id`, `author_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 2, NULL, NULL),
(3, 3, NULL, NULL),
(4, 4, NULL, NULL),
(5, 5, NULL, NULL),
(6, 6, NULL, NULL),
(7, 7, NULL, NULL),
(8, 8, NULL, NULL),
(9, 9, NULL, NULL),
(10, 10, NULL, NULL),
(11, 11, NULL, NULL),
(12, 12, NULL, NULL),
(13, 13, NULL, NULL),
(14, 14, NULL, NULL),
(15, 15, NULL, NULL),
(16, 16, NULL, NULL),
(17, 17, NULL, NULL),
(18, 18, NULL, NULL),
(19, 18, NULL, NULL),
(20, 18, NULL, NULL),
(21, 19, NULL, NULL),
(22, 20, NULL, NULL),
(23, 20, NULL, NULL),
(24, 21, NULL, NULL),
(25, 21, NULL, NULL),
(26, 21, NULL, NULL),
(27, 22, NULL, NULL),
(28, 22, NULL, NULL),
(29, 22, NULL, NULL),
(30, 22, NULL, NULL),
(31, 23, NULL, NULL),
(32, 24, NULL, NULL),
(33, 25, NULL, NULL),
(34, 25, NULL, NULL),
(35, 26, NULL, NULL),
(36, 27, NULL, NULL),
(37, 28, NULL, NULL),
(38, 29, NULL, NULL),
(39, 29, NULL, NULL),
(40, 29, NULL, NULL),
(41, 30, NULL, NULL),
(42, 30, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_covers`
--

CREATE TABLE `book_covers` (
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `design_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `book_covers`
--

INSERT INTO `book_covers` (`book_id`, `design_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(1, 14, NULL, NULL),
(1, 32, NULL, NULL),
(2, 2, NULL, NULL),
(2, 4, NULL, NULL),
(2, 27, NULL, NULL),
(3, 2, NULL, NULL),
(3, 5, NULL, NULL),
(3, 9, NULL, NULL),
(3, 10, NULL, NULL),
(3, 18, NULL, NULL),
(3, 19, NULL, NULL),
(3, 35, NULL, NULL),
(4, 1, NULL, NULL),
(4, 5, NULL, NULL),
(4, 13, NULL, NULL),
(4, 23, NULL, NULL),
(4, 25, NULL, NULL),
(4, 28, NULL, NULL),
(4, 29, NULL, NULL),
(5, 2, NULL, NULL),
(5, 14, NULL, NULL),
(5, 21, NULL, NULL),
(5, 25, NULL, NULL),
(5, 29, NULL, NULL),
(6, 3, NULL, NULL),
(6, 12, NULL, NULL),
(6, 35, NULL, NULL),
(7, 3, NULL, NULL),
(7, 13, NULL, NULL),
(7, 14, NULL, NULL),
(7, 25, NULL, NULL),
(7, 34, NULL, NULL),
(8, 1, NULL, NULL),
(8, 3, NULL, NULL),
(8, 13, NULL, NULL),
(9, 3, NULL, NULL),
(9, 8, NULL, NULL),
(9, 13, NULL, NULL),
(9, 14, NULL, NULL),
(9, 23, NULL, NULL),
(10, 2, NULL, NULL),
(10, 7, NULL, NULL),
(10, 8, NULL, NULL),
(10, 27, NULL, NULL),
(10, 33, NULL, NULL),
(11, 2, NULL, NULL),
(11, 6, NULL, NULL),
(11, 7, NULL, NULL),
(12, 2, NULL, NULL),
(12, 6, NULL, NULL),
(12, 8, NULL, NULL),
(12, 14, NULL, NULL),
(12, 27, NULL, NULL),
(13, 107, NULL, NULL),
(13, 71, NULL, NULL),
(13, 106, NULL, NULL),
(13, 97, NULL, NULL),
(13, 19, NULL, NULL),
(13, 31, NULL, NULL),
(13, 44, NULL, NULL),
(13, 87, NULL, NULL),
(13, 23, NULL, NULL),
(13, 5, NULL, NULL),
(13, 13, NULL, NULL),
(13, 126, NULL, NULL),
(14, 77, NULL, NULL),
(14, 107, NULL, NULL),
(14, 2, NULL, NULL),
(14, 28, NULL, NULL),
(14, 45, NULL, NULL),
(14, 83, NULL, NULL),
(14, 23, NULL, NULL),
(14, 124, NULL, NULL),
(14, 101, NULL, NULL),
(14, 29, NULL, NULL),
(15, 72, NULL, NULL),
(15, 2, NULL, NULL),
(15, 24, NULL, NULL),
(15, 44, NULL, NULL),
(15, 36, NULL, NULL),
(15, 83, NULL, NULL),
(15, 5, NULL, NULL),
(15, 29, NULL, NULL),
(16, 71, NULL, NULL),
(16, 53, NULL, NULL),
(16, 26, NULL, NULL),
(16, 2, NULL, NULL),
(16, 106, NULL, NULL),
(16, 97, NULL, NULL),
(16, 31, NULL, NULL),
(16, 37, NULL, NULL),
(16, 50, NULL, NULL),
(16, 87, NULL, NULL),
(16, 5, NULL, NULL),
(17, 10, NULL, NULL),
(17, 115, NULL, NULL),
(17, 2, NULL, NULL),
(17, 119, NULL, NULL),
(17, 36, NULL, NULL),
(17, 48, NULL, NULL),
(17, 80, NULL, NULL),
(17, 5, NULL, NULL),
(17, 129, NULL, NULL),
(18, 115, NULL, NULL),
(18, 44, NULL, NULL),
(18, 36, NULL, NULL),
(18, 83, NULL, NULL),
(18, 5, NULL, NULL),
(18, 129, NULL, NULL),
(18, 29, NULL, NULL),
(18, 30, NULL, NULL),
(19, 77, NULL, NULL),
(19, 116, NULL, NULL),
(19, 44, NULL, NULL),
(19, 36, NULL, NULL),
(19, 60, NULL, NULL),
(19, 83, NULL, NULL),
(19, 104, NULL, NULL),
(19, 5, NULL, NULL),
(19, 124, NULL, NULL),
(19, 101, NULL, NULL),
(19, 29, NULL, NULL),
(19, 25, NULL, NULL),
(19, 30, NULL, NULL),
(20, 18, NULL, NULL),
(20, 85, NULL, NULL),
(20, 119, NULL, NULL),
(20, 44, NULL, NULL),
(20, 36, NULL, NULL),
(20, 83, NULL, NULL),
(20, 5, NULL, NULL),
(20, 129, NULL, NULL),
(20, 29, NULL, NULL),
(20, 34, NULL, NULL),
(21, 10, NULL, NULL),
(21, 18, NULL, NULL),
(21, 85, NULL, NULL),
(21, 9, NULL, NULL),
(21, 44, NULL, NULL),
(21, 47, NULL, NULL),
(21, 37, NULL, NULL),
(21, 83, NULL, NULL),
(21, 5, NULL, NULL),
(21, 13, NULL, NULL),
(21, 29, NULL, NULL),
(22, 115, NULL, NULL),
(22, 44, NULL, NULL),
(22, 48, NULL, NULL),
(22, 37, NULL, NULL),
(22, 82, NULL, NULL),
(23, 18, NULL, NULL),
(23, 44, NULL, NULL),
(23, 46, NULL, NULL),
(23, 37, NULL, NULL),
(23, 5, NULL, NULL),
(23, 35, NULL, NULL),
(23, 129, NULL, NULL),
(24, 51, NULL, NULL),
(24, 97, NULL, NULL),
(24, 46, NULL, NULL),
(24, 36, NULL, NULL),
(24, 108, NULL, NULL),
(24, 23, NULL, NULL),
(24, 5, NULL, NULL),
(24, 102, NULL, NULL),
(25, 103, NULL, NULL),
(25, 72, NULL, NULL),
(25, 97, NULL, NULL),
(25, 24, NULL, NULL),
(25, 44, NULL, NULL),
(25, 36, NULL, NULL),
(25, 50, NULL, NULL),
(25, 90, NULL, NULL),
(26, 33, NULL, NULL),
(26, 97, NULL, NULL),
(26, 24, NULL, NULL),
(26, 46, NULL, NULL),
(26, 36, NULL, NULL),
(26, 50, NULL, NULL),
(26, 130, NULL, NULL),
(26, 56, NULL, NULL),
(26, 5, NULL, NULL),
(27, 33, NULL, NULL),
(27, 8, NULL, NULL),
(27, 92, NULL, NULL),
(27, 18, NULL, NULL),
(27, 44, NULL, NULL),
(27, 37, NULL, NULL),
(27, 5, NULL, NULL),
(27, 35, NULL, NULL),
(27, 129, NULL, NULL),
(28, 12, NULL, NULL),
(28, 35, NULL, NULL),
(28, 1, NULL, NULL),
(29, 12, NULL, NULL),
(29, 1, NULL, NULL),
(30, 12, NULL, NULL),
(30, 1, NULL, NULL),
(31, 10, NULL, NULL),
(31, 115, NULL, NULL),
(31, 18, NULL, NULL),
(31, 9, NULL, NULL),
(31, 131, NULL, NULL),
(31, 45, NULL, NULL),
(31, 36, NULL, NULL),
(31, 5, NULL, NULL),
(31, 129, NULL, NULL),
(32, 10, NULL, NULL),
(32, 115, NULL, NULL),
(32, 18, NULL, NULL),
(32, 131, NULL, NULL),
(32, 45, NULL, NULL),
(32, 36, NULL, NULL),
(32, 5, NULL, NULL),
(32, 129, NULL, NULL),
(33, 26, NULL, NULL),
(33, 46, NULL, NULL),
(33, 36, NULL, NULL),
(33, 21, NULL, NULL),
(34, 28, NULL, NULL),
(34, 45, NULL, NULL),
(34, 36, NULL, NULL),
(34, 21, NULL, NULL),
(34, 30, NULL, NULL),
(34, 78, NULL, NULL),
(35, 8, NULL, NULL),
(35, 44, NULL, NULL),
(35, 36, NULL, NULL),
(36, 7, NULL, NULL),
(36, 115, NULL, NULL),
(36, 44, NULL, NULL),
(36, 36, NULL, NULL),
(36, 129, NULL, NULL),
(37, 26, NULL, NULL),
(37, 131, NULL, NULL),
(37, 45, NULL, NULL),
(37, 36, NULL, NULL),
(37, 5, NULL, NULL),
(37, 13, NULL, NULL),
(38, 103, NULL, NULL),
(38, 44, NULL, NULL),
(38, 37, NULL, NULL),
(38, 60, NULL, NULL),
(39, 72, NULL, NULL),
(39, 46, NULL, NULL),
(39, 37, NULL, NULL),
(39, 130, NULL, NULL),
(39, 5, NULL, NULL),
(39, 84, NULL, NULL),
(40, 24, NULL, NULL),
(40, 131, NULL, NULL),
(40, 45, NULL, NULL),
(40, 36, NULL, NULL),
(40, 5, NULL, NULL),
(40, 34, NULL, NULL),
(41, 131, NULL, NULL),
(41, 46, NULL, NULL),
(41, 36, NULL, NULL),
(41, 130, NULL, NULL),
(41, 4, NULL, NULL),
(41, 29, NULL, NULL),
(42, 115, NULL, NULL),
(42, 44, NULL, NULL),
(42, 37, NULL, NULL),
(42, 130, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book_genres`
--

CREATE TABLE `book_genres` (
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `genre_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `book_genres`
--

INSERT INTO `book_genres` (`book_id`, `genre_id`, `created_at`, `updated_at`) VALUES
(1, 11, NULL, NULL),
(1, 15, NULL, NULL),
(2, 1, NULL, NULL),
(2, 2, NULL, NULL),
(3, 2, NULL, NULL),
(3, 7, NULL, NULL),
(3, 11, NULL, NULL),
(4, 2, NULL, NULL),
(4, 10, NULL, NULL),
(5, 2, NULL, NULL),
(5, 8, NULL, NULL),
(6, 1, NULL, NULL),
(7, 7, NULL, NULL),
(7, 12, NULL, NULL),
(8, 7, NULL, NULL),
(8, 10, NULL, NULL),
(9, 1, NULL, NULL),
(10, 1, NULL, NULL),
(10, 5, NULL, NULL),
(11, 1, NULL, NULL),
(11, 4, NULL, NULL),
(11, 5, NULL, NULL),
(12, 1, NULL, NULL),
(12, 4, NULL, NULL),
(12, 5, NULL, NULL),
(13, 3, NULL, NULL),
(13, 13, NULL, NULL),
(13, 14, NULL, NULL),
(14, 1, NULL, NULL),
(14, 2, NULL, NULL),
(14, 14, NULL, NULL),
(14, 12, NULL, NULL),
(15, 3, NULL, NULL),
(15, 11, NULL, NULL),
(16, 3, NULL, NULL),
(17, 17, NULL, NULL),
(18, 17, NULL, NULL),
(19, 12, NULL, NULL),
(20, 2, NULL, NULL),
(20, 8, NULL, NULL),
(20, 12, NULL, NULL),
(21, 1, NULL, NULL),
(21, 2, NULL, NULL),
(21, 8, NULL, NULL),
(22, 2, NULL, NULL),
(22, 12, NULL, NULL),
(23, 2, NULL, NULL),
(24, 2, NULL, NULL),
(25, 2, NULL, NULL),
(26, 2, NULL, NULL),
(27, 2, NULL, NULL),
(28, 2, NULL, NULL),
(29, 2, NULL, NULL),
(30, 2, NULL, NULL),
(31, 2, NULL, NULL),
(32, 2, NULL, NULL),
(33, 6, NULL, NULL),
(34, 2, NULL, NULL),
(34, 14, NULL, NULL),
(35, 1, NULL, NULL),
(36, 2, NULL, NULL),
(36, 8, NULL, NULL),
(37, 12, NULL, NULL),
(38, 12, NULL, NULL),
(39, 12, NULL, NULL),
(40, 2, NULL, NULL),
(41, 2, NULL, NULL),
(42, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `c_designs`
--

CREATE TABLE `c_designs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `c_designs`
--

INSERT INTO `c_designs` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Simple', NULL, NULL),
(2, 'Complejo', NULL, NULL),
(3, 'minimalista', NULL, NULL),
(4, 'personas', NULL, NULL),
(5, 'persona', NULL, NULL),
(6, 'animales', NULL, NULL),
(7, 'animada', NULL, NULL),
(8, 'animada_personas', NULL, NULL),
(9, 'historico', NULL, NULL),
(10, 'antiguo', NULL, NULL),
(11, 'autoestima', NULL, NULL),
(12, 'abstracto', NULL, NULL),
(13, 'sombras', NULL, NULL),
(14, 'letras', NULL, NULL),
(15, 'rasgado', NULL, NULL),
(16, 'hoja_doblada', NULL, NULL),
(17, 'romantico', NULL, NULL),
(18, 'cara', NULL, NULL),
(19, 'epico', NULL, NULL),
(20, 'collage', NULL, NULL),
(21, 'objeto', NULL, NULL),
(22, 'simbolo', NULL, NULL),
(23, 'paisajes', NULL, NULL),
(24, 'flores', NULL, NULL),
(25, 'tenebroso', NULL, NULL),
(26, 'ciencia', NULL, NULL),
(27, 'familia', NULL, NULL),
(28, 'gerra', NULL, NULL),
(29, 'suspenso', NULL, NULL),
(30, 'terror', NULL, NULL),
(31, 'espacio', NULL, NULL),
(32, 'estrellas', NULL, NULL),
(33, 'alegria', NULL, NULL),
(34, 'tristeza', NULL, NULL),
(35, 'pintada', NULL, NULL),
(36, 'letras_grandes', NULL, NULL),
(37, 'letras_pequenas', NULL, NULL),
(38, 'letras_pintadas', NULL, NULL),
(39, 'letras_cursiva', NULL, NULL),
(40, 'letras_borrosas', NULL, NULL),
(41, 'letras_colores', NULL, NULL),
(42, 'letras_magicas', NULL, NULL),
(43, 'letras_periodico', NULL, NULL),
(44, 'letras_arriba', NULL, NULL),
(45, 'letras_abajo', NULL, NULL),
(46, 'letras_centro', NULL, NULL),
(47, 'letras_derecha', NULL, NULL),
(48, 'letras_izquierda', NULL, NULL),
(49, 'sin_letras', NULL, NULL),
(50, 'montanas', NULL, NULL),
(51, 'cielo_azul', NULL, NULL),
(52, 'volcanes', NULL, NULL),
(53, 'cielo_rojo', NULL, NULL),
(54, 'verano', NULL, NULL),
(55, 'invierno', NULL, NULL),
(56, 'otono', NULL, NULL),
(57, 'primavera', NULL, NULL),
(58, 'estatua', NULL, NULL),
(59, 'pinturas', NULL, NULL),
(60, 'manos', NULL, NULL),
(61, 'sol', NULL, NULL),
(62, 'luna', NULL, NULL),
(63, 'eclipse', NULL, NULL),
(64, 'rayos', NULL, NULL),
(65, 'religion', NULL, NULL),
(66, 'fuego', NULL, NULL),
(67, 'rey', NULL, NULL),
(68, 'reina', NULL, NULL),
(69, 'reino', NULL, NULL),
(70, 'ajedrez', NULL, NULL),
(71, 'arido', NULL, NULL),
(72, 'bosque', NULL, NULL),
(73, 'magico', NULL, NULL),
(74, 'gigantes', NULL, NULL),
(75, 'casas', NULL, NULL),
(76, 'vampiros', NULL, NULL),
(77, 'ansiedad', NULL, NULL),
(78, 'valentia', NULL, NULL),
(79, 'magico', NULL, NULL),
(80, 'millonarios', NULL, NULL),
(81, 'empresarios', NULL, NULL),
(82, 'ojos', NULL, NULL),
(83, 'misterio', NULL, NULL),
(84, 'suspenso', NULL, NULL),
(85, 'conspiracion', NULL, NULL),
(86, 'alien', NULL, NULL),
(87, 'naves_espaciales', NULL, NULL),
(88, 'pelo', NULL, NULL),
(89, 'huellas', NULL, NULL),
(90, 'nieve', NULL, NULL),
(91, 'garras', NULL, NULL),
(92, 'boca', NULL, NULL),
(93, 'labios', NULL, NULL),
(94, 'frutas', NULL, NULL),
(95, 'banderas', NULL, NULL),
(96, 'noche', NULL, NULL),
(97, 'dia', NULL, NULL),
(98, 'besos', NULL, NULL),
(99, 'globo', NULL, NULL),
(100, 'globo_arostatico', NULL, NULL),
(101, 'salvaje', NULL, NULL),
(102, 'tierno', NULL, NULL),
(103, 'arbol', NULL, NULL),
(104, 'muerte', NULL, NULL),
(105, 'lentes', NULL, NULL),
(106, 'desierto', NULL, NULL),
(107, 'apocalipsis', NULL, NULL),
(108, 'mar', NULL, NULL),
(109, 'animales_acuaticos', NULL, NULL),
(110, 'animales_terrestres', NULL, NULL),
(111, 'animales_voladores', NULL, NULL),
(112, 'carnivoros', NULL, NULL),
(113, 'vuelo', NULL, NULL),
(114, 'brujas', NULL, NULL),
(115, 'blanco_negro', NULL, NULL),
(116, 'borroso', NULL, NULL),
(117, 'mascara', NULL, NULL),
(118, 'llave', NULL, NULL),
(119, 'corbata', NULL, NULL),
(120, 'zapatilla', NULL, NULL),
(121, 'parejas', NULL, NULL),
(122, 'muertos', NULL, NULL),
(123, 'castillo', NULL, NULL),
(124, 'perturbador', NULL, NULL),
(125, 'agua', NULL, NULL),
(126, 'tierra', NULL, NULL),
(127, 'oriental', NULL, NULL),
(128, 'latino', NULL, NULL),
(129, 'rostro', NULL, NULL),
(130, 'mujer', NULL, NULL),
(131, 'hombre', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genres`
--

CREATE TABLE `genres` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `genre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `genres`
--

INSERT INTO `genres` (`id`, `genre`, `created_at`, `updated_at`) VALUES
(1, 'Aventuras', NULL, NULL),
(2, 'Ficción', NULL, NULL),
(3, 'Ciencia ficción', NULL, NULL),
(4, 'Hadas', NULL, NULL),
(5, 'Infantiles', NULL, NULL),
(6, 'Educativo', NULL, NULL),
(7, 'Gótico', NULL, NULL),
(8, 'Pilicíaco', NULL, NULL),
(9, 'Paranormal', NULL, NULL),
(10, 'Distópica', NULL, NULL),
(11, 'Fantástico', NULL, NULL),
(12, 'Terror', NULL, NULL),
(13, 'Épico', NULL, NULL),
(14, 'Guerra', NULL, NULL),
(15, 'Histórico', NULL, NULL),
(16, 'Emprendimiento', NULL, NULL),
(17, 'Biografia', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interests`
--

CREATE TABLE `interests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `interests`
--

INSERT INTO `interests` (`id`, `user_id`, `book_id`, `created_at`, `updated_at`) VALUES
(1, 1, 24, NULL, NULL),
(5, 1, 29, NULL, NULL),
(6, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_11_28_183324_create_sessions_table', 1),
(7, '2020_11_30_044728_create_books_table', 1),
(8, '2020_11_30_051055_create_genres_table', 1),
(9, '2020_11_30_051306_create_book_genres_table', 1),
(10, '2020_11_30_051351_create_publishers_table', 1),
(11, '2020_11_30_051852_create_authors_table', 1),
(12, '2020_11_30_052209_create_book_authors_table', 1),
(13, '2020_11_30_052210_create_c_designs_table', 1),
(14, '2020_11_30_053708_create_book_covers_table', 1),
(15, '2021_03_11_223901_create_interests_table', 2),
(16, '2021_03_12_034812_user_type', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publishers`
--

CREATE TABLE `publishers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `publishers`
--

INSERT INTO `publishers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Ninguna', '2020-12-06 11:30:24', '2020-12-06 11:30:24'),
(2, 'Ninguna', '2020-12-06 11:33:06', '2020-12-06 11:33:06'),
(3, 'ESPASA', '2020-12-06 11:35:43', '2020-12-06 11:35:43'),
(4, 'PLAZA JANES', '2020-12-06 11:38:04', '2020-12-06 11:38:04'),
(5, 'SUMA', '2020-12-06 11:40:40', '2020-12-06 11:40:40'),
(6, 'DESTINO', '2020-12-07 00:53:50', '2020-12-07 00:53:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('h8hG5qOpfcKusCXGepetw9J585KDbNVl0nqfufb8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMld4OHh6c3RLMHVhNzJWbldqZHQyQWhkb05xcUNjcHVlS050NkJVRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovL2xvY2FsaG9zdDo4MDAwIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fX0=', 1617164427);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `type`) VALUES
(1, 'Marvin', 'marvinjosue97@gmail.com', NULL, '$2y$10$zpk18c6IclD/UUrw.4AUF.tCYuzSfKcaEdlFk7MCdQC5RZNSGk6iK', NULL, NULL, NULL, NULL, NULL, '2020-12-06 11:27:55', '2020-12-14 12:22:20', 'admin'),
(2, 'Prueba', 'prueba@prueba.com', NULL, '$2y$10$wq0/dGXkgYpzUtmGKXg3AusJFlPCwEzTd/XrgzzMyG88ew159tHhG', NULL, NULL, NULL, NULL, NULL, '2021-03-31 09:17:26', '2021-03-31 09:17:26', 'user');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `book_authors`
--
ALTER TABLE `book_authors`
  ADD KEY `book_authors_book_id_foreign` (`book_id`),
  ADD KEY `book_authors_author_id_foreign` (`author_id`);

--
-- Indices de la tabla `book_covers`
--
ALTER TABLE `book_covers`
  ADD KEY `book_covers_book_id_foreign` (`book_id`),
  ADD KEY `book_covers_design_id_foreign` (`design_id`);

--
-- Indices de la tabla `book_genres`
--
ALTER TABLE `book_genres`
  ADD KEY `book_genres_book_id_foreign` (`book_id`),
  ADD KEY `book_genres_genre_id_foreign` (`genre_id`);

--
-- Indices de la tabla `c_designs`
--
ALTER TABLE `c_designs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interests_user_id_foreign` (`user_id`),
  ADD KEY `interests_book_id_foreign` (`book_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `publishers`
--
ALTER TABLE `publishers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `c_designs`
--
ALTER TABLE `c_designs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `genres`
--
ALTER TABLE `genres`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `interests`
--
ALTER TABLE `interests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publishers`
--
ALTER TABLE `publishers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `book_authors`
--
ALTER TABLE `book_authors`
  ADD CONSTRAINT `book_authors_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  ADD CONSTRAINT `book_authors_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);

--
-- Filtros para la tabla `book_covers`
--
ALTER TABLE `book_covers`
  ADD CONSTRAINT `book_covers_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_covers_design_id_foreign` FOREIGN KEY (`design_id`) REFERENCES `c_designs` (`id`);

--
-- Filtros para la tabla `book_genres`
--
ALTER TABLE `book_genres`
  ADD CONSTRAINT `book_genres_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `book_genres_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`);

--
-- Filtros para la tabla `interests`
--
ALTER TABLE `interests`
  ADD CONSTRAINT `interests_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`),
  ADD CONSTRAINT `interests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
