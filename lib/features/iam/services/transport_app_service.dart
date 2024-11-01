import 'dart:convert';
import 'package:http/http.dart' as http;

class TransportAppService {
  final String baseUrl = 'http://127.0.0.1:8080';

  // Método para el inicio de sesión
  Future<http.Response> signIn(Map<String, String> credentials) async {
    final url = Uri.parse('$baseUrl/api/v1/authentication/sign-in');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(credentials),
      );
      return response;
    } catch (error) {
      throw Exception('Error en la conexión: $error');
    }
  }

  // Método para el registro de usuario
  Future<http.Response> signUp(Map<String, dynamic> userData) async {
    final url = Uri.parse('$baseUrl/api/v1/authentication/sign-up');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );
      return response;
    } catch (error) {
      throw Exception('Error en la conexión: $error');
    }
  }
}

