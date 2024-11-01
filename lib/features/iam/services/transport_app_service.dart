import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class TransportAppService {
  final String baseUrl = 'https://transportapp-crg0gmeuevexfscb.eastus2-01.azurewebsites.net';

  // Método para el inicio de sesión
  Future<http.Response> signIn(Map<String, String> credentials) async {
    final url = Uri.parse('$baseUrl/api/v1/authentication/sign-in');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(credentials),
      );
      if (response.statusCode == 200) {
        // Guarda el token si la autenticación es exitosa
        final data = jsonDecode(response.body);
        final token = data['token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
      }
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

    // Método para registrar el perfil del usuario
  Future<http.Response> createProfile(Map<String, dynamic> profileData) async {
    final url = Uri.parse('$baseUrl/api/v1/profiles');
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token'); // Recupera el token almacenado
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(profileData),
      );
      return response;
    } catch (error) {
      throw Exception('Error en la conexión: $error');
    }
  }

    // Método para cerrar sesión
  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Elimina el token guardado al cerrar sesión
  }

  // Método para obtener el token (opcional, si necesitas verificar el estado de autenticación)
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

    Future<http.Response> getUserRole(int userId, String token) async {
    final url = Uri.parse('$baseUrl/api/v1/users/$userId');
    return await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Agrega el token en la cabecera
      },
    );
  }
}

