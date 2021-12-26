import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:manejador_estados/Models/Usuario.dart';
import 'package:manejador_estados/bloc/usuario/usuario_cubit.dart';


class Pagina2Page extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  
  final usuarioCubit = context.read<UsuarioCubit>();
  
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color:  Colors.white),),
              color: Colors.blue,
            
              onPressed: (){
                final newUser = new Usuario(
                  name: 'Nicolas Zambrano',
                  edad: 22,
                  profesiones: [
                    'Flutter Developer',
                    'VideoJugador Veterano'
                  ]
                );
                usuarioCubit.seleccionarUsuaro(newUser);

            }),
            MaterialButton(
              child: Text('Cambiar edad', style: TextStyle(color:  Colors.white),),
              color: Colors.blue,
            
              onPressed: (){
                usuarioCubit.cambiarEdad(40);

            }),
            MaterialButton(
              child: Text('Añador Profesión', style: TextStyle(color:  Colors.white),),
              color: Colors.blue,
            
              onPressed: (){
                usuarioCubit.agregarprofesion();

            })
          ],
        )
     ),
   );
  }
}