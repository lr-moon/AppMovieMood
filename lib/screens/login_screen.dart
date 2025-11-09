import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/local_auth_service.dart'; // Ruta corregida

// --- IMPORTS ELIMINADOS ---
// Se quitaron 'package:http/http.dart' y 'dart:convert'

import 'home_screen.dart';
import 'forgot_password_screen.dart';
import 'create_account_screen.dart';

// --- Definición del Widget de la Pantalla de Inicio de Sesión ---
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// --- Clase de Estado para LoginScreen ---
class _LoginScreenState extends State<LoginScreen> {
  // --- Controladores y estado para la visibilidad de la contraseña ---
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  // --- Estado de Carga ---
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // --- Función de navegación ---
  void _navigateToHome() {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  // --- FUNCIÓN DE LOGIN MODIFICADA ---
  // Se eliminó toda la lógica de 'http', 'try-catch' de red y
  // la validación de email/contraseña.
  Future<void> _onLoginSuccess() async {
    // 1. Iniciar el estado de carga
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }

    try {
      // 2. Ejecutar la lógica de "login exitoso" directamente
      // (Esta era la parte que estaba dentro del 'if (response.statusCode == 200)')

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('usuarioYaLogueado', true);

      final LocalAuthService authService = LocalAuthService();
      final bool canCheck = await authService.canCheckBiometrics();

      if (canCheck && mounted) {
        // 3. Mostrar diálogo para activar la huella
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => AlertDialog(
            backgroundColor: const Color(0xFF2C2C2E),
            title: const Text(
              'Inicio de Sesión Rápido',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              '¿Te gustaría usar tu huella dactilar para iniciar sesión la próxima vez?',
              style: TextStyle(color: Colors.white70),
            ),
            actions: [
              TextButton(
                child: const Text(
                  'No, gracias',
                  style: TextStyle(color: Colors.white70),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  _navigateToHome();
                },
              ),
              TextButton(
                child: const Text(
                  'Sí, activar',
                  style: TextStyle(color: Color(0xFFD4AF37)),
                ),
                onPressed: () async {
                  await prefs.setBool('usarHuella', true);
                  Navigator.of(ctx).pop();
                  _navigateToHome();
                },
              ),
            ],
          ),
        );
      } else {
        // 4. Si no hay biometría, solo navegar a home
        _navigateToHome();
      }
      // --- Fin de la lógica de huella ---
    } catch (e) {
      // 5. Capturar cualquier error local (ej. SharedPreferences o LocalAuth)
      print('Error en lógica de login local: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error local: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      // 6. Detener el estado de carga (pase lo que pase)
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // --- Encabezado con logo y título ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              decoration: const BoxDecoration(
                color: Color(0xFF8B2E41), // Tu color granate
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.movie_filter, color: Colors.white, size: 40),
                  const SizedBox(width: 12),
                  const Text(
                    'MovieMood',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Georgia',
                    ),
                  ),
                ],
              ),
            ),
            // --- Contenido del Formulario ---
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Color(0xFF2C2C2E),
                        child: Icon(
                          Icons.person,
                          size: 60.0,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 32.0),

                      // --- Campo de texto para Usuario (Correo) ---
                      const Text(
                        'Correo electrónico',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black87),
                        decoration: InputDecoration(
                          hintText: 'Correo electrónico',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      // --- Campo de texto para Contraseña ---
                      const Text(
                        'Contraseña',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: passwordController,
                        obscureText: !_isPasswordVisible,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black87),
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      // --- Botón de "Olvidó su contraseña" ---
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: _isLoading
                              ? null
                              : () {
                                  // Deshabilitar si está cargando
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPasswordScreen(),
                                    ),
                                  );
                                },
                          child: const Text(
                            '¿Se te olvido tu contraseña?',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      // --- Botón de "Entrar" ---
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                              0xFFD4AF37,
                            ), // Color Dorado
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          // Sigue llamando a la misma función, pero ahora esa función no tiene API
                          onPressed: _isLoading ? null : _onLoginSuccess,
                          child: _isLoading
                              // Muestra indicador de carga
                              ? const SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                    strokeWidth: 3,
                                  ),
                                )
                              : const Text(
                                  'Entrar',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      // --- Botón para crear cuenta ---
                      TextButton(
                        onPressed: _isLoading
                            ? null
                            : () {
                                // Deshabilitar si está cargando
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CreateAccountScreen(),
                                  ),
                                );
                              },
                        child: const Text(
                          '¿No tienes una cuenta? Crear cuenta',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
