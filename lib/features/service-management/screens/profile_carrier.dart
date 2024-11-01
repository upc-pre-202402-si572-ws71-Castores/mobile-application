import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileCarrier extends StatelessWidget {
  const ProfileCarrier({super.key});

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
                    Color.fromARGB(255, 37, 62, 107)
                  ],
                  stops: [
                    0.04,
                    0.5,
                    0.8
                  ],
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(25.0))),
        ),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                //alignment: Alignment.bottomLeft,
                child: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
        toolbarHeight: 110,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Asegura que todo esté centrado horizontalmente
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/manuel_zevallos.jpg'),
              ),
              const SizedBox(height: 10),
              const Text(
                'Manuel Zevallos',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 17, 35),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Transportista independiente con 10 años de experiencia. Especializado en el traslado de carga pesada. Cuento con tecnología IoT para el monitoreo en tiempo real de mis vehículos, garantizando entregas seguras y puntuales.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // Centra los items dentro del contenedor
                  children: const [
                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.black54),
                      title: Text('+51 989893298', style: TextStyle(fontSize: 18)),
                    ),
                    ListTile(
                      leading: Icon(Icons.perm_identity, color: Colors.black54),
                      title: Text('67875567', style: TextStyle(fontSize: 18)),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on, color: Colors.black54),
                      title: Text('San Martin, Lima', style: TextStyle(fontSize: 18)),
                    ),
                    ListTile(
                      leading: Icon(Icons.local_shipping, color: Colors.black54),
                      title: Text('Cargo Truck', style: TextStyle(fontSize: 18)),
                    ),
                    ListTile(
                      leading: Icon(Icons.directions_car, color: Colors.black54),
                      title: Text('2 Vehicles', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Mostrar formulario cuando se hace clic en "Add Vehicle"
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Type of vehicle',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'License plate',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Capacity',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Papers',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 15),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Model',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 15),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Acción para guardar el vehículo
                                  Navigator.pop(context);
                                },
                                child: const Text('Add vehicle'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF274C77),
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                  textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );                },
                child: const Text('Add Vehicle'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF274C77), // Aquí se cambió 'primary' por 'backgroundColor'
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  foregroundColor: Colors.white, // Color del texto (blanco)
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}