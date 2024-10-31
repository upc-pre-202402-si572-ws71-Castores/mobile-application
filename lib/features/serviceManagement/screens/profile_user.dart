import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileClient extends StatelessWidget {
  const ProfileClient({super.key});

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
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/samantha_myers.jpg'),
              ),
              const SizedBox(height: 10),
              const Text(
                'Samantha Myers',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 17, 35),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Soy un cliente que busca servicios de transporte confiables para el envío de mercadería. Valoro la puntualidad y la seguridad en el traslado, y prefiero empresas que ofrezcan monitoreo en tiempo real para estar siempre informado sobre el estado de mis envíos.',
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
