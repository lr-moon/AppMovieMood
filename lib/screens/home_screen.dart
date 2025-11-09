import 'package:flutter/material.dart';
// Importa la pantalla de reseñas para poder navegar hacia ella.
import 'resenas_screen.dart';
// ¡NUEVO! Importa la pantalla de agregar reseña
import 'agregar_resena_screen.dart';

// --- Definición del Widget de la Pantalla de Inicio ---
// Es un StatelessWidget porque su contenido no cambia basado en interacciones internas;
// simplemente muestra información y opciones de navegación.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  // --- Método build ---
  // Construye la interfaz de usuario de la pantalla.
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E), // Color de fondo oscuro.
      body: SafeArea(
        // Organiza el contenido en una columna vertical.
        child: Column(
          children: <Widget>[
            // --- Encabezado ---
            // Un contenedor con diseño consistente con el resto de la app.
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              decoration: const BoxDecoration(
                color: Color(0xFF8B2E41),
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

            // --- Contenido Principal ---
            // Expanded asegura que esta sección ocupe todo el espacio vertical disponible.
            Expanded(
              child: Center(
                // SingleChildScrollView permite el desplazamiento si el contenido excede la pantalla.
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Mensaje de bienvenida.
                      const Text(
                        '¡Bienvenido!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Subtítulo o eslogan de la app.
                      const Text(
                        'Descubre, comparte y gestiona tus reseñas de películas y series favoritas.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      const SizedBox(height: 30),

                      // --- Tarjeta de Acción "Ver Reseñas" ---
                      // Utiliza el widget reutilizable ActionCard.
                      ActionCard(
                        icon: Icons.rate_review,
                        title: 'Ver Reseñas',
                        subtitle:
                            'Explora todas las reseñas de películas y series.',
                        // Define la acción al tocar la tarjeta.
                        onTap: () {
                          // Navega a la pantalla ResenasScreen.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResenasScreen(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      // --- Tarjeta de Acción "Agregar reseña" ---
                      ActionCard(
                        icon: Icons.add_circle,
                        title: 'Agregar reseña',
                        subtitle:
                            'Comparte tu opinión sobre una película o serie.',
                        onTap: () {
                          // Implementa la navegación a la pantalla de agregar reseña.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AgregarResenaScreen(),
                            ),
                          );
                        },
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

// --- Widget reutilizable para las Tarjetas de Acción ---
// Este widget encapsula el diseño y la lógica de una tarjeta de acción,
// haciéndolo fácil de usar en diferentes partes de la app con distintos datos.
class ActionCard extends StatelessWidget {
  final IconData icon; // El icono a mostrar.
  final String title; // El título principal de la tarjeta.
  final String subtitle; // El texto descriptivo.
  final VoidCallback onTap; // La función que se ejecuta al tocar la tarjeta.

  const ActionCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // GestureDetector detecta los toques del usuario.
    return GestureDetector(
      onTap: onTap, // Asigna la función de callback al evento de toque.
      child: Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2E), // Color de fondo de la tarjeta.
          borderRadius: BorderRadius.circular(20.0),
        ),
        // Organiza el contenido de la tarjeta en una columna.
        child: Column(
          children: [
            Icon(icon, color: Colors.greenAccent, size: 40),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
