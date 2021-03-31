import 'package:flutter/material.dart';
 
import 'package:manejador_estados/Pages/Pagina1_pages.dart';
import 'package:manejador_estados/Pages/Pagina2_pages.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'Pagina1',
      routes: {
        'Pagina1': ( _ ) => Pagina1Page(),
        'Pagina2': ( _ ) => Pagina2Page()
      },
    );
  }
}