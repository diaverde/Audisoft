// Librerías a importar
import 'package:flutter/material.dart';
import 'dart:convert';

// Para HTTP
import 'package:http/http.dart' as http;

// Páginas a importar
import 'MisClases.dart';

// Variable  global para el enlace de la función
const String website = 'https://madness7.azurewebsites.net/api/ObtenerReviews';


// Clase para nuestra página inicial
class PagInicio extends StatefulWidget {  
  @override
  _PagInicioState createState() => _PagInicioState();
}

class _PagInicioState extends State<PagInicio> {

  // Las reseñas son de tipo Future porque se obtienen asíncronamente
  Future<ListaReview> futureReviews;  

  // Contador de reseñas recibidas
  int revNum = 0;
  
  @override
  void initState() {
    super.initState();
    futureReviews = fetchReviews();
  }

  // Método para limpiar recursos
  @override
  void dispose() {    
    super.dispose();
  }  

  @override
  Widget build(BuildContext context) {

    // Sección de título
    Widget titleSection = Container(
      padding: const EdgeInsets.only(top:30, left: 30, right: 30),
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
        ],
      )
    );

    // Sección de botón
    Widget buttonSection = Container(
      padding: EdgeInsets.only(top: 50),
      child: InkWell(
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
        ),
        onTap: (){
          Navigator.pushNamed(context, '/registro');
        },
      )
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
            _reviewSection(),
            buttonSection,
          ],
        ),
      ),
    );
  
  }

  // Sección de reseñas
  Container _reviewSection() {  
    return Container(
      child: FutureBuilder<ListaReview>(
        future: futureReviews,
        builder: (context, snapshot) {
          if (snapshot.hasData) {              
            // Procesamos las tarjetas en una lista            
            List<Review> listaReviews = List(revNum);
            for (int j=0; j<revNum; j++) {
              listaReviews[j] = Review.fromJson(snapshot.data.review[j]);
            }
            return Column(              
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal:30, vertical: 10),
                  alignment: Alignment.centerLeft,
                  child: Text("Estas son las últimas críticas de tus amigos:"),
                ),
                Column(
                  children: _llenarCriticas(listaReviews)
                )
              ]
            );
              
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return 
            Center(child:CircularProgressIndicator());
        },
      ),
    );
  }

  // Función para hacer petición GET y procesar datos
  Future<ListaReview> fetchReviews() async {
    // Armar la solicitud GET con la URL de la página y el parámetro
    final response = await http.get(website);    

    if (response.statusCode == 200) {
      // Si hay una respuesta OK, procesamos el json
      try {        
        //print(response.body);
        ListaReview fetchedList = ListaReview.fromJson(json.decode(response.body));        
        _getReviewNumber(fetchedList);        
        return fetchedList;
      } catch (e) {
        //print('Something really unknown: $e');        
        throw Exception('No hay reseñas disponibles.');
      }    
    } else {
      // Sin respuesta adecuada, lanzar excepción      
      throw Exception('Error del Servidor');
    }
  }

  // Función para actualizar el número de reseñas
  void _getReviewNumber(ListaReview miLista) {
    setState(() {      
      revNum = miLista.review.length;
    });
  }

  // Método que retorna la información de cada reseña
  List<Widget> _llenarCriticas(List listaReviews) {
    return new List<Widget>.generate(listaReviews.length, (int i) {      
      return Column(
        children: [
          InkWell(
            child: _review(listaReviews[i]),
            onTap: () {            
              Navigator.pushNamed(context, '/critica', arguments: listaReviews[i]);
            }
          ),
          Divider(thickness: 2, height: 0, indent: 20, endIndent: 20)
        ]
      );
    });
  }

  // Método para las reseñas
  Container _review(Review review) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal:20, vertical: 15),
      child: Row(
        children: [
          // Foto
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.network(
              review.userPic,
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
          // Foto película
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.network(
              review.filmPic,
              width: 60,
            ),
          ),
        ],
      ),
    );
  }
    
}