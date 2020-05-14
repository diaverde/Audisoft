import 'package:flutter/material.dart';


//String userData = "{'Email': 'rogue@xmen.com', 'Nombre': 'Anna Marie', 'Apellido':'D\\'Ancanto', 'Activo': 'false', 'TipoUsuario': '1'}";

// Clase principal
class PagConfirma extends StatelessWidget {  
  
  @override
  Widget build(BuildContext context) {

    // Para capturar el argumento
    final String userData = ModalRoute.of(context).settings.arguments;

    // Contenido
    Widget textSection = Column(      
      children: [
        Container(
          padding: const EdgeInsets.all(30),
          alignment: Alignment.centerLeft,
          child: Text(
            "El registro ha sido exitoso.\nBienvenido al mundo Panem",
            style: TextStyle(
              fontSize: 16
            ),
          )
        ),
        Container(
          padding: const EdgeInsets.all(30),
          alignment: Alignment.centerLeft,
          child: Text(
            userData,            
            style: TextStyle(
              fontSize: 16
            ),
          ),
        ),
      ],
    );

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
          textSection,
          _buttonSection(context)
        ]
      )
    );
  } 
  
}
