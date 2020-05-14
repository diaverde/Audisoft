// Librerías a importar
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

// Para validar correo electrónico
import 'package:email_validator/email_validator.dart';

import 'misClases.dart';


// Clase para nuestra página de registro
class PagRegistro extends StatelessWidget {  
    @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Panem')
      ),
      body: ListView(
        children: [
          headerSection,          
          MyCustomForm()
        ]
      )
    );
  }
}

// Encabezado
Widget headerSection = Container(
  padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Bienvenida(o) a la comunidad Panem.\nIngresa tus datos a continuación:',        
        style: TextStyle(
          fontSize: 16
        ),
      ),
    ],
  ),
);


// Formulario como Stateful widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Clase "Estado" para el formulario
class MyCustomFormState extends State<MyCustomForm> {
  // Crear "global key" para identificar el formulario
  // y permitir la validación
  final _formKey = GlobalKey<FormState>();
  // Crear controlador de texto para procesar entrada
  // de los TextField.  
  final controllerPwd = TextEditingController();  

  // Inicializar un objeto de la clase Usuario para guardar los datos
  Usuario _newUser = Usuario();
  
  // Método para inicializar
  @override
  void initState() {
    super.initState();    
  }

  // Método para limpiar el controlador
  @override
  void dispose() {
    controllerPwd.dispose();    
    super.dispose();
  }  

  // Método para crear el formulario
  @override
  Widget build(BuildContext context) {    
    // Con la llave anterior, construir el formulario
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Nombre
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child:TextFormField(              
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                labelText: 'Ingrese nombre y apellido',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(                  
                  borderSide: BorderSide(width: 1, color: Colors.black)
                ),
                hintText: 'Nombre+Apellido'
              ),
              inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-zA-Z ]"))],
              validator: (value) {
                if (value.isEmpty) return 'Ingrese su nombre';
                return null;
              },
              onSaved: (val) => setState(() => _newUser.nombre = val),
            )
          ),
          // Correo electrónico
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child:TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                labelText: 'Ingrese su correo electrónico',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(                  
                  borderSide: BorderSide(width: 1, color: Colors.black)
                ),
                hintText: 'Correo electrónico'
              ),
              inputFormatters: [BlacklistingTextInputFormatter(RegExp("[ \t]"))],
              validator: (value) {
                if (value.isEmpty) {
                  return 'Ingrese su e-mail';
                } else if (!EmailValidator.validate(value)) {
                  return 'Ingrese un e-mail válido';
                }
                return null;
              },
              onSaved: (val) => setState(() => _newUser.email = val),
            )
          ),
          // Nombre de usuario
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child:TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                labelText: 'Ingrese su nombre de usuario',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(                  
                  borderSide: BorderSide(width: 1, color: Colors.black)
                ),
                hintText: 'Nombre de usuario'
              ),
              inputFormatters: [BlacklistingTextInputFormatter(RegExp("[ \t\n\r]"))],
              validator: (value) {
                if (value.isEmpty) return 'Ingrese su nombre de usuario';
                return null;
              },
              onSaved: (val) => setState(() => _newUser.alias = val),
            )
          ),
          // Contraseña
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child:TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                labelText: 'Ingrese su contraseña',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(                  
                  borderSide: BorderSide(width: 1, color: Colors.black)
                ),
                hintText: 'Contraseña'
              ),
              inputFormatters: [BlacklistingTextInputFormatter(RegExp("[\n\t\r]"))],
              validator: (value) {
                if (value.isEmpty) return 'Ingrese la contraseña';
                return null;
              },
              controller: controllerPwd,
            )
          ),
          // Confirmación contraseña
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child:TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                labelText: 'Confirme su contraseña',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(                  
                  borderSide: BorderSide(width: 1, color: Colors.black)
                ),
                hintText: 'Confirmar contraseña'
              ),
              inputFormatters: [BlacklistingTextInputFormatter(RegExp("[\n\t\r]"))],
              validator: (value) {
                if (value.isEmpty) return 'Ingrese la contraseña en este campo también';
                else if (value != controllerPwd.text) return 'Las contraseñas no coinciden. Verifique.';
                return null;
              },
              onSaved: (val) => setState(() => _newUser.password = val),
            )
          ),
          // Container del botón
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            child: RaisedButton(
              color: Colors.blueAccent,
              onPressed: () {
                // Validar                
                if (_formKey.currentState.validate()) {                  
                  _formKey.currentState.save();
                  String result = jsonEncode(_newUser);                  
                  //_showDialog(context, result);
                  Navigator.pushNamed(context, '/confirmar', arguments: result);
                }
              },
              child: Text(
                'Registrar',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
                )
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Método de prueba
  /*
  _showDialog(BuildContext context, String result) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(result)));
  }
  */
}