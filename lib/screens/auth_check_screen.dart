import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/local_auth_service.dart'; // Importa el servicio
import 'login_screen.dart'; // Importa la pantalla de login
import 'home_screen.dart'; // Importa la pantalla principal

// Definimos tus colores para usarlos en el 'loading'
const Color kDarkBackground = Color(0xFF1C1C1E);
const Color kGoldColor = Color(0xFFD4AF37);

class AuthCheckScreen extends StatefulWidget {
  const AuthCheckScreen({super.key});

  @override
  State<AuthCheckScreen> createState() => _AuthCheckScreenState();
}

class _AuthCheckScreenState extends State<AuthCheckScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth(); // Comprueba la autenticación al iniciar
  }

  Future<void> _checkAuth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final LocalAuthService authService = LocalAuthService();

    // Comprueba si el usuario eligió usar la huella
    final bool usarHuella = prefs.getBool('usarHuella') ?? false;

    // Pequeña demora para que se vea el logo (opcional, pero da mejor UX)
    await Future.delayed(const Duration(milliseconds: 500));

    if (usarHuella) {
      // 1. Si SÍ quiere usar huella, intenta autenticar
      final bool didAuthenticate = await authService.authenticate(
        'Por favor, autentícate para abrir MovieMood',
      );

      if (didAuthenticate && mounted) {
        // Si la huella es correcta, va al Home
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else if (mounted) {
        // Si cancela o falla, lo mandas al Login normal
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    } else {
      // 2. Si NO quiere usar huella (o nunca la ha activado)
      // Lo mandamos directo al Login
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Muestra un indicador de carga mientras se decide a dónde ir
    return const Scaffold(
      backgroundColor: kDarkBackground, // Usando el color de tu app
      body: Center(child: CircularProgressIndicator(color: kGoldColor)),
    );
  }
}
