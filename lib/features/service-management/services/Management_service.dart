import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ManagementService {
  final String baseUrl = 'https://transportapp-crg0gmeuevexfscb.eastus2-01.azurewebsites.net';

  Future<Map<String, dynamic>?> getProfileById(int profileId) async {
    final url = Uri.parse('$baseUrl/api/v1/profiles/$profileId');

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null) {
        print('Token no encontrado. Por favor, inicia sesión.');
        return null;
      }

      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Error al obtener el perfil: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error de conexión: $error');
      return null;
    }
  }
}