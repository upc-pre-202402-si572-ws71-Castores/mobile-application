import 'package:flutter/material.dart';
import '../widgets/w_offer_card.dart';

class ClientOffersScreen extends StatelessWidget {
  const ClientOffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: const [
            OfferCard(
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
            OfferCard(
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
            OfferCard(
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