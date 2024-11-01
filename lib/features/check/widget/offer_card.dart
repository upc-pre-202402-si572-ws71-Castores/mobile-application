import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String name;
  final String vehicleType;
  final String price;
  final String offerDate;
  final String temperature;
  final String weight;
  final String origin;
  final String destination;
  final String startDate;
  final String arrivalDate;

  const OfferCard({
    super.key,
    required this.name,
    required this.vehicleType,
    required this.price,
    required this.offerDate,
    required this.temperature,
    required this.weight,
    required this.origin,
    required this.destination,
    required this.startDate,
    required this.arrivalDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // Establece el color del Card a blanco
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Imagen de perfil
                  radius: 30,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(vehicleType),
                    Text(
                      'Offer created on $offerDate',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.ac_unit, size: 20),
                    const SizedBox(width: 5),
                    Text('Ideal temperature\n$temperature'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.scale, size: 20),
                    const SizedBox(width: 5),
                    Text('Ideal Weight\n$weight'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      origin,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Start date:\n$startDate'),
                  ],
                ),
                const Icon(Icons.arrow_forward),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Arrival date:\n$arrivalDate'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('Confirm'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Decline'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
