import 'package:flutter/material.dart';

// Para HTTP
import 'package:http/http.dart' as http;


// Variable global para el enlace de la función
const String website = 'https://madness7.azurewebsites.net/api/CrearUsuario';


// Clase principal
class PagConfirma extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {

    // Para capturar el argumento
    final String myUserData = ModalRoute.of(context).settings.arguments;    

    // Sección del botón
    Container _buttonSection(BuildContext context) {
      return Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
        child: RaisedButton(
          color: Colors.blueAccent,
          onPressed: () {
            // Volver al inicio
            Navigator.popUntil(context, ModalRoute.withName('/'));            
          },
          child: Text(
            'Volver al inicio',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white
            )
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Panem")        
      ),
      body: Column(
        children: [
          TextSection(userData: myUserData),
          _buttonSection(context)
        ]
      )
    );

  }
  
}



// Contenido
class TextSection extends StatefulWidget {

  final String userData;
  const TextSection ({ Key key, this.userData }): super(key: key);

  @override
  _TextSectionState createState() => _TextSectionState();
}

class _TextSectionState extends State<TextSection> {

  // Usuario tipo Future porque se obtiene asíncronamente
  Future<String> futureUser;
  
  @override
  void initState() {
    super.initState();
    futureUser = createUser(widget.userData);
  }
  
  @override
  Widget build(BuildContext context) {  
    return Container(
      padding: const EdgeInsets.all(30),
      child: FutureBuilder<String>(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if(snapshot.data =="already"){
              return Container(
                padding: const EdgeInsets.all(30),
                alignment: Alignment.centerLeft,
                child: Text(
                  "El usuario ya está registrado\n"
                  "Por favor regrese al formulario y revise sus datos o bien vuelva al menú inicial.",
                  style: TextStyle(
                    fontSize: 16
                  ),
                )
              );
            } else {
              return Container(
                padding: const EdgeInsets.all(30),
                alignment: Alignment.centerLeft,
                child: Text(
                  "El registro ha sido exitoso.\nBienvenido al mundo Panem",
                  style: TextStyle(
                    fontSize: 16
                  ),
                )
              );
            }
          } else if (snapshot.hasError) {              
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner.
          return CircularProgressIndicator();
        },
      )
    );
  }
    
  

  // Función para hacer petición POST y procesar datos
  Future <String> createUser(String userData) async {
    // Armar la petición POST con la URL de la página y el parámetro
    //final response = await http.get(website + '?user=' + webParam);
    final response = await http.post(website, body: userData);
    print(userData);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response
      //print('Response status: ${response.statusCode}');
      //print('Response body: ${response.body}');
      if (response.body.contains("usuario ya está registrado")) {
        return "already";
      } else {
        return "ok";
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.      
      throw Exception('Error del Servidor. Intente de nuevo más tarde.');
    }
  }

}
