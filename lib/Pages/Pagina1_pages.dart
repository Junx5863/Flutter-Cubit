import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:manejador_estados/Models/Usuario.dart';
import 'package:manejador_estados/bloc/usuario/usuario_cubit.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: BlocScaffold(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'Pagina2'),
        child: Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}

class BlocScaffold extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {


        switch ( state.runtimeType ) {

          case UsuarioInitial:
            return Center(
            child: Text('No hay informacion del usuario.')
          );
          break;

          case UsuarioActivo:
            return InformacionUsario( (state as UsuarioActivo).usuario ); //-> tocaria hacer es cast del estado hacia lo que se quiere traer
          break;


          default:
            return Center(child: Text('No hay estado'),);
        }
      //   if (state is UsuarioInitial) {
      //     return Center(
      //       child: Text('No hay informacion del usuario.'),
      //     );
      //   } else if (state is UsuarioActivo) {
      //     return InformacionUsario(state.usuario);
      //   } else {
      //     return Center(child: Text('No hay estado'),);
      //   }
      },
    );
  }
}

class InformacionUsario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(
              title: Text('Nombre: ${usuario.name}'),
            ),
            ListTile(
              title: Text('Edad: ${usuario.edad}'),
            ),
            Text(
              'Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ...usuario.profesiones.map((profesion) => ListTile(
                  title: Text(profesion),
                )).toList()
          ],
        ));
  }
}
