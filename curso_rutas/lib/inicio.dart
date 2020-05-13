// Librerías a importar
import 'package:curso_layout/usuario.dart';
import 'package:flutter/material.dart';

// Páginas a importar
import 'critica.dart';
import 'usuario.dart';


// Clase para nuestra página inicial
class PagInicio extends StatelessWidget {

  final Usuario myUser1 = Usuario(
    userTitle : "Mi crítica de la última Kung Fu Panda",
    filmName : "Kung Fu Panda 3",
    userName : "LeiaSky77",
    userPic : 'images/caro.jpg',
    userReview : 'Kung Fu Panda 3 es una buena película. Tiene buenos chistes, una trama bien construida, personajes '
                  'cómicos, etc. El problema es que no es la primera, sino la tercera entrega de una saga. Todo eso ya '
                  'estaba antes, y ahora no se aparta ni un ápice del camino ya recorrido. Es hora de innovar o morir.',
    filmPic : 'images/kfp3.jpg'
  );

  final Usuario myUser2 = Usuario(
    userTitle : "Las diferencias no son tan malas",
    filmName : "Yo antes de ti",
    userName : "BobbieCruz",
    userPic : 'images/roberto.jpg',
    userReview : 'Gente, tienen que ver esta película. Está filmada en mi parte favorita de Gales, con otros escenarios '
                  'de lujo en Inglaterra. Emilia Clarke no es solo dragones y series de modas, la chica sabe actuar y lo '
                  'hace muy bien en esta película que conmoverá hasta al más oscuro de los corazones.',
    filmPic : 'images/mby.jpg'
  );

  final Usuario myUser3 = Usuario(
    userTitle : "Agatha Christie vive en el siglo XXI",
    filmName : "Entre navajas y secretos",
    userName : "Cata666",
    userPic : 'images/sara.jpg',
    userReview : 'No me han gustado mucho las últimas adaptaciones de libros de Agatha Christie, pero esta versión está '
                  'de lujo. Un gran elenco con Daniel Craig como el detective Benoit Blanc (con un acento extraño) y la '
                  'siempre encantadora Ana de Armas en un papel muy tierno. Un desarrollo de los hechos inesperado, como, '
                  'por supuesto, su final.',
    filmPic : 'images/knives.jpg'
  );
  
  
  @override
  Widget build(BuildContext context) {   

    // Sección de título
    Widget titleSection = Container(
      padding: const EdgeInsets.all(30),
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,        
        children: <Widget>[
          Text(
            "Hola.\n",
            style : TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            )
          ),
          Text("Estas son las últimas críticas de tus amigos:"),
        ],
      )
    );

    // Sección de botón
    Widget buttonSection = Container(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.accessibility),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              "Quiero participar",
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      )
    );
  

    // Sección de críticas
    Widget reviewSection = Column(      
      children: [
        InkWell(
          child: _review(myUser1),
          onTap: () {
            usuario = myUser1;
            Navigator.pushNamed(context, '/critica');
          }
        ),
        Divider(thickness: 2, height: 0, indent: 20, endIndent: 20),
        InkWell(
          child: _review(myUser2),
          onTap: () {
            usuario = myUser2;
            Navigator.pushNamed(context, '/critica');
          }
        ),
        Divider(thickness: 2, height: 0, indent: 20, endIndent: 20),
        InkWell(
        child: _review(myUser3),
        onTap: () {
            usuario = myUser3;
            Navigator.pushNamed(context, '/critica');
          }
        ),
      ],
    );
    

    return MaterialApp(
      title: 'Panem',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Panem'),
        ),
        body: ListView(
          children: [            
            titleSection,
            reviewSection,
            buttonSection,
          ],
        ),
      ),
    );
  }

  // Método para las reseñas
    Container _review(Usuario usuario) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal:20, vertical: 15),
        child: Row(
          children: [
            // Foto
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                usuario.userPic,
                height: 50,
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
                      usuario.userTitle,
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
                        usuario.filmName,
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
                        usuario.userName,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // Foto película
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset(
                usuario.filmPic,
                width: 60,
              ),
            ),
          ],
        ),
      );
    }
  
}