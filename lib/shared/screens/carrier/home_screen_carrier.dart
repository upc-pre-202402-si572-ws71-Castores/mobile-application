import 'package:flutter/material.dart';
import 'package:transport_app_mobile/shared/widgets/bottomNavigationBar.dart';
import 'package:transport_app_mobile/shared/screens/screens.dart';

class HomeScreenCarrier extends StatefulWidget {
  @override
  _HomeScreenCarrierState createState() => _HomeScreenCarrierState();
}

class _HomeScreenCarrierState extends State<HomeScreenCarrier> with SingleTickerProviderStateMixin {
  // Estado para controlar el índice de la pantalla activa
  int _selectedIndex = 0;

  // Lista de pantallas que se mostrarán según el índice
  static List<Widget> _widgetOptions = <Widget>[
    DashboardCarrier(),
    CarrierOffersScreen(),
    HistoryCarrierScreen(),
    ProfileCarrier(),
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