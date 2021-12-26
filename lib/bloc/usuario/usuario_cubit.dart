import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:manejador_estados/Models/Usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuaro(Usuario user) {
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;

    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copyWith(edad: edad);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarprofesion() {
    final currentState = state;
    if ( currentState is UsuarioActivo ) {
      // currentState.usuario
      final newProfesiones = [
        ...currentState.usuario.profesiones,
        'Profesión ${ currentState.usuario.profesiones.length + 1 }'
      ];
      final newUser = currentState.usuario.copyWith( profesion: newProfesiones );
      emit( UsuarioActivo(newUser) );
    }
  }
}
