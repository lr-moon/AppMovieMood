import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthService {
  final LocalAuthentication _auth = LocalAuthentication();

  // 1. Comprobar si hay biometría disponible en el dispositivo
  Future<bool> canCheckBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print('Error al comprobar biometría: $e');
      return false;
    }
  }

  // 2. Función principal para autenticar
  Future<bool> authenticate(String reason) async {
    try {
      // Muestra el diálogo nativo del sistema
      return await _auth.authenticate(
        localizedReason: reason, // El mensaje que verá el usuario
        options: const AuthenticationOptions(
          stickyAuth: true, // Pide biometría, pero permite PIN/Patrón si falla
          biometricOnly: false, // Permite otros métodos si biometría no está
        ),
      );
    } on PlatformException catch (e) {
      print('Error durante la autenticación: $e');
      return false;
    }
  }
}
