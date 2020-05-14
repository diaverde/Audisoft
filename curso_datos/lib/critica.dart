// Librerías a importar
import 'package:flutter/material.dart';

import 'MisClases.dart';

// Variable global con datos de una reseña
Review review;

// Clase para nuestra página de críticas
class PagCritica extends StatelessWidget {  
  
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
              review.userPic,
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
                    review.userTitle,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Datos de la película
                Row(
                  children: [                    
                    Text(
                      'Película: ',
                      style: TextStyle(
                        color: Colors.grey[800],
                      ),
                    ),
                    Text(
                      review.filmName,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                // Datos del usuario
                Row(
                  children: [
                    Text(
                      'Por: ',
                      style: TextStyle(
                        color: Colors.grey[800],
                      ),
                    ),
                    Text(
                      review.userName,
                      style: TextStyle(
                        color: Colors.grey[600],
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
        review.userReview,
        softWrap: true,
      ),
    );

    // Sección de botones
    Widget buttonSection = Container(
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //_buildButtonColumn(Icons.star_border, 'Me gusta'),
          Favorite(),
          _buildButtonColumn(Icons.share, 'Compartir'),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Panem'),
      ),
      body: ListView(
        children: [
          Image.asset(
            review.filmPic,
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,            
          textSection,
          buttonSection,
        ],
      ),
    );
  }

  // Función para construir cada botón
  Column _buildButtonColumn(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.blue),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}


// Stateful Widget opcional para la estrella
class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

// Estado correspondiente al Stateful Widget
class _FavoriteState extends State<Favorite> {
  // Variable para indicar si la reseña es "favorita"
  bool _isFavorited = false;
  
  @override
  Widget build(BuildContext context) {
    
    // Icono
    Icon myIcon = _isFavorited ? Icon(Icons.star, color: Colors.red) : Icon(Icons.star_border, color: Colors.blue);
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(          
          child: myIcon,
          onTap: () => _toggleFavorite(),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            "Me gusta",
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }  

  // Método para seleccionar o deseleccionar como favorita
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) _isFavorited = false;
      else _isFavorited = true;      
    });
  }
}