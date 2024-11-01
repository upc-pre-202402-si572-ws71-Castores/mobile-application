import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:transport_app_mobile/shared/screens/screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transport_app_mobile/features/iam/screens/forgot_password_screen.dart';
import 'package:transport_app_mobile/features/iam/services/transport_app_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TransportAppService _transportAppService = TransportAppService();

  bool isSignUpMode = false;
  String selectedRole = 'ROLE_CLIENT'; // Variable para el rol seleccionado


  Future<void> _signIn(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      // Primer paso: autenticación
      final response = await _transportAppService.signIn({
        'username': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];
        final userId = data['id'];

        // Guarda el token y el userId en SharedPreferences para futuros usos
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setInt('userId', userId);

        // Segundo paso: obtener el rol del usuario usando el userId
        final roleResponse = await _transportAppService.getUserRole(userId, token);

        if (roleResponse.statusCode == 200) {
          final roleData = jsonDecode(roleResponse.body);
          final role = roleData['roles'][0]; // Obtiene el primer rol del usuario

          // Redirige a la pantalla correspondiente según el rol
          if (role == 'ROLE_CLIENT') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreenClient()),
            );
          } else if (role == 'ROLE_TRANSPORTER') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreenCarrier()),
            );
          } else {
            // Si el rol no coincide, muestra un mensaje de error
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Rol desconocido')),
            );
          }
        } else {
          // Manejo de error en la solicitud del rol
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al obtener el rol del usuario')),
          );
        }
      } else {
        // Manejo de error en la autenticación
        final errorData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorData['message'] ?? 'Credenciales incorrectas')),
        );
      }
    } catch (error) {
      print('Error en el inicio de sesión: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en la autenticación: $error')),
      );
    }
  }

  Future<void> _signUp(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Las contraseñas no coinciden')),
      );
      return;
    }

    try {
      final response = await _transportAppService.signUp({
        'username': email,
        'password': password,
        'roles': [selectedRole], // Usa el rol seleccionado aquí
      });

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registro exitoso')),
        );
        setState(() {
          isSignUpMode = false;
        });
        // Navega a SignUpScreen después de un registro exitoso
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SingUpScreen()),
        );
      } else {
        final errorData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorData['message'] ?? 'Error en el registro')),
        );
      }
    } catch (error) {
      print('Error en el registro: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en el registro: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Image.asset('assets/transportapp-logo.png', height: 100),
              SizedBox(height: 20),
              Text(
                'TransportApp',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSignUpMode = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSignUpMode ? Colors.grey[200] : Color(0xFF274C76),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: isSignUpMode ? Colors.black : Colors.white, // Cambia el color según el modo
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isSignUpMode = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSignUpMode ? Color(0xFF274C76) : Colors.grey[200],
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: isSignUpMode ? Colors.white : Colors.black, // Cambia el color según el modo
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              if (isSignUpMode) ...[
                SizedBox(height: 10),
                TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                // DropdownButton para seleccionar el rol
                DropdownButtonFormField<String>(
                  value: selectedRole,
                  onChanged: (String? newRole) {
                    setState(() {
                      selectedRole = newRole!;
                    });
                  },
                  items: <String>['ROLE_CLIENT', 'ROLE_TRANSPORTER']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value == 'ROLE_CLIENT' ? 'Client' : 'Transporter'),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Select Role',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => isSignUpMode ? _signUp(context) : _signIn(context),
                child: Text(isSignUpMode ? 'Sign Up' : 'Sign In'),
              ),
              SizedBox(height: 10),
              if (!isSignUpMode)
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
                  },
                  child: Text('Forgot password?'),
                ),
            ],
          ),
        ),
      ),
    );
  }
  
}
