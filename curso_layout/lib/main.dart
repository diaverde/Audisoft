// Librerías a importar
import 'package:flutter/material.dart';

// El programa principal
void main() {
  runApp(MyApp());
}

// Clase raíz
class MyApp extends StatelessWidget {
  
  final String userTitle = "Mi crítica de la última Kung Fu Panda";
  final String filmName = "Kung Fu Panda 3";
  final String userName = "LeiaSky77";
  final String userPic = 'images/user_pic.jpg';
  final String userReview = 'Kung Fu Panda 3 es una buena película. Tiene buenos chistes, una trama bien construida, personajes cómicos, etc. '
                            'El problema es que no es la primera, sino la tercera entrega de una saga. Todo eso ya estaba antes, y ahora no se '
                            'aparta ni un ápice del camino ya recorrido…';
  
  @override
  Widget build(BuildContext context) {
    
    // Sección de título
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          // Foto
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              userPic,              
              height: 70,              
            ),
          ),
          Expanded(            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Título de la crítica
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    userTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Datos de la película
                Row(
                  children: [                    
                    Text(
                      'Película:',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      filmName,
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                // Datos del usuario
                Row(
                  children: [
                    Text(
                      'Por:',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      userName,
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),          
        ],
      ),
    );

    // Sección de texto
    Widget textSection = Container(
      padding: const EdgeInsets.all(10),
      child: Text(
        userReview,
        softWrap: true,
      ),
    );

    // Color a utilizar
    Color color = Theme.of(context).primaryColor;
    // Sección de botones
    Widget buttonSection = Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.star_border, 'Me gusta'),
          _buildButtonColumn(color, Icons.share, 'Compartir'),
        ],
      ),
    );

    return MaterialApp(
      title: 'Demo layout',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo layout'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/kfp3.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,            
            textSection,
            buttonSection,
          ],
        ),
      ),
    );
  }

  // Función para construir cada botón
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: color,
              decoration: TextDecoration.underline,  
            ),
          ),
        ),
      ],
    );
  }
}