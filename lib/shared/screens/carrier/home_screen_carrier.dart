import 'package:flutter/material.dart';
import 'package:transport_app_mobile/shared/widgets/bottomNavigationBar.dart';
import 'package:transport_app_mobile/shared/screens/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenCarrier extends StatefulWidget {
  @override
  _HomeScreenCarrierState createState() => _HomeScreenCarrierState();
}

class _HomeScreenCarrierState extends State<HomeScreenCarrier>
    with SingleTickerProviderStateMixin {
  // Estado para controlar el índice de la pantalla activa
  int? userId; // Variable para almacenar el ID del usuario
  int _selectedIndex = 0; // Índice para la barra de navegación
  @override
  void initState() {
    super.initState();
    _getUserId(); // Recuperar el ID del usuario al inicializar
  }

    Future<void> _getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('userId'); // Recuperar el ID

    if (id != null) {
      setState(() {
        userId = id; // Asigna el ID del usuario a la variable local
      });
    } else {
      // Manejo de error: redirigir al login o mostrar mensaje
      print('Error: No se encontró el ID del usuario');
    }
  }

// Lista de pantallas con el ID dinámico
  List<Widget> _buildWidgetOptions() {
    if (userId == null) {
      // Mostrar indicador de carga si el ID aún no está disponible
      return [const Center(child: CircularProgressIndicator())];
    }

    return [
    DashboardCarrier(profileId: userId!),
    CarrierOffersScreen(),
    HistoryCarrierScreen(),
    ProfileCarrier(profileId: userId!),
  ];
  }
  // Cuando se selecciona un ítem en la barra de navegación
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cambia el índice seleccionado
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildWidgetOptions().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        icons: [Icons.dashboard, Icons.home, Icons.flash_on, Icons.person],
        selectedIndex: _selectedIndex, // Índice seleccionado
        onItemTapped: _onItemTapped, // Función para cambiar de pantalla
      ),
    );
  }
}
