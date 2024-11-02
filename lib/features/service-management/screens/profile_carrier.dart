import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:transport_app_mobile/features/service-management/services/Management_service.dart';

class ProfileCarrier extends StatefulWidget {
  final int profileId;

  const ProfileCarrier({super.key, required this.profileId});

  @override
  _ProfileCarrierState createState() => _ProfileCarrierState();
}

class _ProfileCarrierState extends State<ProfileCarrier> {
  final ManagementService _managementService = ManagementService();
  String fullName = '';
  String city = '';
  String description = 'Transportista independiente con experiencia en el traslado de carga pesada, especializado en monitoreo en tiempo real.';

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    final profileData = await _managementService.getProfileById(widget.profileId);

    if (profileData != null) {
      setState(() {
        fullName = profileData['fullName'] ?? 'Nombre no disponible';
        city = profileData['city'] ?? 'Ciudad no disponible';
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al obtener el perfil')),
      );
    }
  }

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
        title: const Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 35,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
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
                backgroundImage: AssetImage('assets/manuel_zevallos.jpg'),
              ),
              const SizedBox(height: 10),
              Text(
                fullName.isNotEmpty ? fullName : 'Cargando...',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 17, 35),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
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
                  children: [
                    const ListTile(
                      leading: Icon(Icons.phone, color: Colors.black54),
                      title: Text('+51 989893298', style: TextStyle(fontSize: 18)),
                    ),
                    const ListTile(
                      leading: Icon(Icons.perm_identity, color: Colors.black54),
                      title: Text('67875567', style: TextStyle(fontSize: 18)),
                    ),
                    ListTile(
                      leading: const Icon(Icons.location_on, color: Colors.black54),
                      title: Text(
                        city.isNotEmpty ? city : 'Cargando...',
                        style: const TextStyle(fontSize: 18),
                      ),
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
