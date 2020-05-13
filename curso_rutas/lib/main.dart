// Librerías a importar
import 'package:flutter/material.dart';

// Páginas a importar
import 'inicio.dart';
import 'critica.dart';

// El programa principal
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Panem',
      // La ruta inicial es "/"
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        // Clase de la ruta inicial.
        "/": (BuildContext context) => PagInicio(),
        // Y nombramos el resto de rutas.
        "/critica": (BuildContext context) => PagCritica(),        
      },      
    );
  }
}
