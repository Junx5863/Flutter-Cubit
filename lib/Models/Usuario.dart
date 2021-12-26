class Usuario{
  final String name;
  final int edad;
  final List<String> profesiones;

  Usuario({this.name, this.edad, this.profesiones});



  Usuario copyWith({String nombre, int edad, List<String> profesion}){
    return Usuario(
      name: name ?? this.name,
      edad: edad ?? this.edad,
      profesiones: profesiones ?? this.profesiones
    );

  }
}