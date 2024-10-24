import 'package:flutter/material.dart';
import 'package:transport_app_mobile/shared/widgets/bottomNavigationBar.dart';
import 'package:transport_app_mobile/shared/screens/screens.dart';

class HomeScreenClient extends StatefulWidget {
  @override
  _HomeScreenClientState createState() => _HomeScreenClientState();
}

class _HomeScreenClientState extends State<HomeScreenClient> with SingleTickerProviderStateMixin {
  // Estado para controlar el índice de la pantalla activa
  int _selectedIndex = 0;

  // Lista de pantallas que se mostrarán según el índice
  static List<Widget> _widgetOptions = <Widget>[
    dashboard(),
    Text('Home'),
    Text('History'),
    Text('Profile'),
  ];

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
        child: _widgetOptions.elementAt(_selectedIndex), 
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        icons: [
          Icons.dashboard,
          Icons.home,
          Icons.flash_on,
          Icons.person
        ],
        selectedIndex: _selectedIndex, // Índice seleccionado
        onItemTapped: _onItemTapped, // Función para cambiar de pantalla
      ),
    );
  }


}