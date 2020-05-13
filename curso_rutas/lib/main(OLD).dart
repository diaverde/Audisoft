// Librerías a importar
import 'package:curso_layout/usuario.dart';
import 'package:flutter/material.dart';

// Páginas a importar
import 'critica.dart';
import 'usuario.dart';


// Clase para nuestra página inicial
class PagInicio extends StatelessWidget {

  final String userTitle1 = "Mi crítica de la última Kung Fu Panda";
  final String filmName1 = "Kung Fu Panda 3";
  final String userName1 = "LeiaSky77";
  final String userPic1 = 'images/caro.jpg';
  final String userReview1 = 'Kung Fu Panda 3 es una buena película. Tiene buenos chistes, una trama bien construida, personajes '
                  'cómicos, etc. El problema es que no es la primera, sino la tercera entrega de una saga. Todo eso ya '
                  'estaba antes, y ahora no se aparta ni un ápice del camino ya recorrido. Es hora de innovar o morir.';
  final String filmPic1 = 'images/kfp3.jpg';

  final String userTitle2 = "Las diferencias no son tan malas";
  final String filmName2 = "Yo antes de ti";
  final String userName2 = "BobbieCruz";
  final String userPic2 = 'images/roberto.jpg';
  final String userReview2 = 'Gente, tienen que ver esta película. Está filmada en mi parte favorita de Gales, con otros escenarios '
                  'de lujo en Inglaterra. Emilia Clarke no es solo dragones y series de modas, la chica sabe actuar y lo '
                  'hace muy bien en esta película que conmoverá hasta al más oscuro de los corazones.';
  final String filmPic2 = 'images/mby.jpg';

  final String userTitle3 = "Agatha Christie vive en el siglo XXI";
  final String filmName3 = "Entre navajas y secretos";
  final String userName3 = "Cata666";
  final String userPic3 = 'images/sara.jpg';
  final String userReview3 = 'No me han gustado mucho las últimas adaptaciones de libros de Agatha Christie, pero esta versión está '
                  'de lujo. Un gran elenco con Daniel Craig como el detective Benoit Blanc (con un acento extraño) y la '
                  'siempre encantadora Ana de Armas en un papel muy tierno. Un desarrollo de los hechos inesperado, como, '
                  'por supuesto, su final.';
  final String filmPic3 = 'images/knives.jpg';
  
  
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
          child: _review(userTitle1, filmName1, userName1, userPic1, userReview1, filmPic1),
          onTap: () {
            //usuario = myUser1;
            Navigator.pushNamed(context, '/critica');
          }
        ),
        Divider(thickness: 2, height: 0, indent: 20, endIndent: 20),
        InkWell(
          child: _review(userTitle2, filmName2, userName2, userPic2, userReview2, filmPic2),
          onTap: () {
            //usuario = myUser2;
            Navigator.pushNamed(context, '/critica');
          }
        ),
        Divider(thickness: 2, height: 0, indent: 20, endIndent: 20),
        InkWell(
        child: _review(userTitle3, filmName3, userName3, userPic3, userReview3, filmPic3),
        onTap: () {
            //usuario = myUser3;
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
    Container _review(String userTitle, String filmName, String userName, String userPic, String userReview, String filmPic) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal:20, vertical: 15),
        child: Row(
          children: [
            // Foto
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                userPic,
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
                        'Película: ',
                        style: TextStyle(
                          color: Colors.grey[800],
                        ),
                      ),
                      Text(
                        filmName,
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
                        userName,
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
                filmPic,
                width: 60,
              ),
            ),
          ],
        ),
      );
    }
  
}