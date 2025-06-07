/*4. Cree una clase Libro con las propiedades titulo, autor, y anioPublicacion. Crea una clase
Biblioteca que contenga una lista de libros y funciones para:
a. Agregar libros.
b. Eliminar libros.
c. Buscar libros por autor.
d. Listar todos los libros ordenados por año de publicación. */

void main() {
  //Libros de prueba.
  final biblioteca = Biblioteca();

  // Libros agregados para pruebas
  biblioteca.agregarLibro(
    Libro(
      titulo: "El Principe",
      autor: "Nicolas Maquiavelo",
      anioPublicacion: 1532,
    ),
  );

  biblioteca.agregarLibro(
    Libro(
      titulo: "Basta de historias",
      autor: "Andres Oppenheimer",
      anioPublicacion: 2010,
    ),
  );

  biblioteca.agregarLibro(
    Libro(
      titulo: "Cuentos Chinos",
      autor: "Andres Oppenheimer",
      anioPublicacion: 2023,
    ),
  );

  biblioteca.agregarLibro(
    Libro(
      titulo: "El malestar en la globalizacion",
      autor: "Joseph Stiglitz",
      anioPublicacion: 2002,
    ),
  );

  biblioteca.agregarLibro(
    Libro(
      titulo: "Cuando las tarantulas atacan",
      autor: "Longino Becerrra",
      anioPublicacion: 1987,
    ),
  );

  biblioteca.agregarLibro(
    Libro(
      titulo: "Cien anos de soledad",
      autor: "Gabriel Garcia Marquez",
      anioPublicacion: 1967,
    ),
  );

  biblioteca.agregarLibro(
    Libro(
      titulo: "Rebelion en la granja",
      autor: "George Orwell",
      anioPublicacion: 1945,
    ),
  );

  biblioteca.agregarLibro(
    Libro(
      titulo: "Don Quijote de la Mancha",
      autor: "Miguel de Cervantes",
      anioPublicacion: 1605,
    ),
  );

  biblioteca.agregarLibro(
    Libro(titulo: "La Odisea", autor: "Homero", anioPublicacion: -800),
  );

  biblioteca.agregarLibro(
    Libro(
      titulo: "Fahrenheit 451",
      autor: "Ray Bradbury",
      anioPublicacion: 1953,
    ),
  );

  biblioteca.agregarLibro(
    Libro(
      titulo: "El amor en los tiempos del colera",
      autor: "Gabriel Garcia Marquez",
      anioPublicacion: 1985,
    ),
  );

  biblioteca.agregarLibro(
    Libro(
      titulo: "Ensayo sobre la ceguera",
      autor: "Jose Saramago",
      anioPublicacion: 1995,
    ),
  );

  biblioteca.agregarLibro(
    Libro(
      titulo: "Cronica de una muerte anunciada",
      autor: "Gabriel Garcia Marquez",
      anioPublicacion: 1981,
    ),
  );

  //Consulta de libros por autor.

  print("\nConsultado libros del autor Nicolas Maquiavelo");
  biblioteca
      .buscarLibro(autor: "Nicolas Maquiavelo")
      .forEach((libr0) => print("- ${libr0.titulo}"));
  print("Removemos el libro El Principe del autor Maquiavelo");

  //Eliminando el libro de la biblioteca.
  biblioteca.removerLibro(titulo: "El Principe");

  //Que pasa si intentamos remover un titulo que no se encuentra en la biblioteca?
  print(
    "\nPrueba al intentar remover un libro que no se encuentra en la biblioteca",
  );

  try {
    biblioteca.removerLibro(titulo: "El Principe");
  } catch (e) {
    print(e);
  }

  //Segunda consulta de los libros de dicho autor para verificar que se haya eliminado.
  print("Consultado libros del autor Nicolas Maquiavelo");
  try {
    biblioteca
        .buscarLibro(autor: "Nicolas Maquiavelo")
        .forEach((libr0) => print("- ${libr0.titulo}"));
  } catch (e) {
    print(e);
  }

  //Ordenando libros por fecha de publicacion.
  print("\nLista de libros ordenados por su anio de publicacion.");
  biblioteca.listaAnioPublicacionLibro().forEach(
    (libr0) => print(
      "- ${libr0.titulo} - Anio de publicacion: ${libr0.anioPublicacion}",
    ),
  );

  // biblioteca.libros.forEach((libro) {
  //   print(libro.titulo);
  // });
}

//Definicion de la clase Libro
class Libro {
  final String titulo;
  final String autor;
  final int anioPublicacion;

  Libro({
    required this.titulo,
    required this.autor,
    required this.anioPublicacion,
  });
}

//Definicion de la clase Biblioteca
class Biblioteca {
  final List<Libro> libros = [];

  //Funcion para agregar libros a la biblioteca.
  void agregarLibro(Libro unitLibro) {
    libros.add(unitLibro);
  }

  /*
  numbers.removeWhere((item) => item.length == 3);
  print(numbers);
   */

  //Funcion para eliminar libros de la biblioteca
  void removerLibro({required String titulo}) {
    int cantLibros = libros.length;
    libros.removeWhere((libro) => libro.titulo == titulo);
    //Valindando si se logro remover el libro solicitado.
    if (cantLibros == libros.length)
      throw Exception(
        "No se ha encontrado el libro ${titulo}, asi que no se puede eliminar.",
      );
  }

  //Funcion para buscar libros por autor.
  List<Libro> buscarLibro({required String autor}) {
    final encontrados = libros.where((libro) => libro.autor == autor).toList();

    if (encontrados.isEmpty)
      throw Exception(
        "No se han encontrado libros al nombre del autor ${autor}",
      );
    return encontrados;
  }

  //funcion para listar todos los libros ordenados por año de publicación.
  List<Libro> listaAnioPublicacionLibro() {
    final List<Libro> librosOrdenado = this.libros;

    librosOrdenado.sort(
      (a, b) => a.anioPublicacion.compareTo(b.anioPublicacion),
    );
    return librosOrdenado;
    /*([int Function(Libro, Libro)? compare]) → void
  Sorts this list according to the order specified by the [compare] function.
  The [compare] function must act as a [Comparator].
    // Sort from shortest to longest.
  numbers.sort((a, b) => a.length.compareTo(b.length));
  print(numbers); // [two, four, three]
  The default [List] implementations use [Comparable.compare] if [compare] is omitted.
  */
  }
}
