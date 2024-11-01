import 'package:flutter/material.dart';

class ClientOffersScreen extends StatelessWidget {
  const ClientOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 17, 35),
                Color.fromARGB(255, 10, 35, 78),
                Color.fromARGB(255, 37, 62, 107),
              ],
              stops: [0.04, 0.5, 0.8],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25.0)),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Text(
            'Create Request',
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        toolbarHeight: 110,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            color: Colors.white, // Establece el color del Card a blanco
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInputField("Start location", "Lima", Icons.location_on),
                  const SizedBox(height: 20),
                  _buildInputField("Arrival place", "Arequipa", Icons.place),
                  const SizedBox(height: 20),
                  _buildInputField("Type of vehicle", "Heavy duty truck", Icons.local_shipping),
                  const SizedBox(height: 20),
                  _buildInputField("Ideal temperature", "25", Icons.thermostat),
                  const SizedBox(height: 20),
                  _buildInputField("Ideal weight", "1.7 t", Icons.scale),
                  const SizedBox(height: 20),
                  _buildInputField("Offered price", "300 soles", Icons.attach_money),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      ElevatedButton(
                        onPressed: () {
                          // Acción para el botón "Confirm"
                        },
                        child: const Text("Confirm"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String initialValue, IconData icon) {
    final TextEditingController controller = TextEditingController(text: initialValue);
    final FocusNode focusNode = FocusNode();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        controller.clear();
      }
    });

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}