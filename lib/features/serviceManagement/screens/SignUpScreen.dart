import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingUpScreen extends StatefulWidget {
  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  // Estado para manejar la selección entre Client y Carrier
  int selectedRole = 0; // 0 es para Client, 1 es para Carrier

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('TransporApp'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Regresar a la pantalla anterior
          },
        ),
      ),
      body: SingleChildScrollView( // Habilita el desplazamiento
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              // Toggle para seleccionar Client o Carrier
              ToggleButtons(
                isSelected: [selectedRole == 0, selectedRole == 1],
                onPressed: (int index) {
                  setState(() {
                    selectedRole = index; // Actualiza la selección
                  });
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Client'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text('Carrier'),
                  ),
                ],
                fillColor: Colors.blue, // Color cuando está seleccionado
                selectedColor: Colors.white, // Texto cuando está seleccionado
                borderRadius: BorderRadius.circular(8.0),
              ),
              SizedBox(height: 20),
              // Campos de entrada de texto
              _buildTextField('Full Name'),
              SizedBox(height: 10),
              _buildTextField('Phone Number'),
              SizedBox(height: 10),
              _buildTextField('Date of Birth'),
              SizedBox(height: 10),
              _buildTextField('Province'),
              SizedBox(height: 10),
              _buildTextField('DNI'),
              SizedBox(height: 10),
              _buildTextField('Photo'),
              SizedBox(height: 10),
              _buildTextField('Description profile'),
              SizedBox(height: 20),
              // Botón de Sign Up
              ElevatedButton(
                onPressed: () {
                  // Lógica para guardar el tipo de cliente
                  String role = selectedRole == 0 ? 'Client' : 'Carrier';
                  print('User is signing up as: $role');
                  // Aquí podrías guardar los datos y tipo de cliente en la base de datos o API
                },
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para simplificar la creación de campos de texto
  Widget _buildTextField(String labelText) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),


    );
  }
}

