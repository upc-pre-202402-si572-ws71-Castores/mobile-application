
import 'package:flutter/material.dart';
import '../../service-management/widget/history_card.dart';

class HistoryClientScreen extends StatelessWidget {
  const HistoryClientScreen({super.key});

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
                  'History',
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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: const [
            HistoryCard(
              name: "Manuel Zevallos",
              vehicleType: "Cargo truck",
              price: "S/ 300",
              offerDate: "March 17",
              temperature: "05°C",
              weight: "500 Kg",
              origin: "Lima",
              destination: "Arequipa",
              startDate: "22/06/2024",
              arrivalDate: "25/06/2024",
            ),
            HistoryCard(
              name: "Juan Pedro",
              vehicleType: "Cargo truck",
              price: "S/ 250",
              offerDate: "March 17",
              temperature: "01°C",
              weight: "150 Kg",
              origin: "Lima",
              destination: "Cuzco",
              startDate: "22/06/2024",
              arrivalDate: "25/06/2024",
            ),
          ],
        ),
      ),
    );
  }
}