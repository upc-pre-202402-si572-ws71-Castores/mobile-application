import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<IconData> icons;
  final Function(int) onItemTapped; // Añadimos un callback para manejar los taps
  final int selectedIndex; // Índice seleccionado actual

  const CustomBottomNavigationBar({
    Key? key,
    required this.icons,
    required this.onItemTapped,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60, // Ajusta la altura del BottomNavigationBar
        padding: EdgeInsets.symmetric(horizontal: 60), // Ajusta el padding para que no sea demasiado alto
        margin: EdgeInsets.only(bottom: 10, left: 20, right: 20), 
        decoration: BoxDecoration(
          color: Color(0xFF274C77).withOpacity(1),
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            icons.length,
            (index) => GestureDetector(
              onTap: () {
                onItemTapped(index); // Llamamos al callback cuando se toque el ícono
              },
              child: Icon(
                icons[index],
                size: 28, // Ajusta el tamaño del ícono
                color: index == selectedIndex
                    ? Color.fromARGB(207, 255, 255, 255)
                    : const Color.fromARGB(255, 255, 255, 255), // Cambia el color del ícono cuando está seleccionado
              ),
            ),
          ),
        ),
      ),
    );
  }
}