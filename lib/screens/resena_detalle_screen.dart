import 'package:flutter/material.dart';

// --- Definición de los colores ---
const Color kMaroonColor = Color(0xFF8B2E41);
const Color kGoldColor = Color(0xFFD4AF37);
// --- NUEVOS COLORES para el modo claro ---
const Color kLightBackground = Color(0xFFFFFFFF); // Fondo blanco
const Color kDarkText = Color(0xFF2d2d2d); // Texto principal (casi negro)
const Color kSubtleText = Color(0xFF5f5f5f); // Texto secundario (gris)

class ResenaDetalleScreen extends StatelessWidget {
  final String titulo;
  final String critica;
  final double calificacion;
  final String imagenAsset;

  const ResenaDetalleScreen({
    super.key,
    required this.titulo,
    required this.critica,
    required this.calificacion,
    required this.imagenAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 37, 37),

      appBar: AppBar(
        backgroundColor: kMaroonColor,
        foregroundColor: Colors.white,
        elevation: 10,
        title: Text(titulo, style: const TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          // CAMBIO: Alineación a la izquierda
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Imagen con Sombra y Altura Fija ---
            Container(
              margin: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 15.0,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    imagenAsset,
                    // CAMBIO: Altura fija para controlar el espacio
                    height: 350.0,
                    width:
                        MediaQuery.of(context).size.width * 0.85, // Ancho fijo
                    fit: BoxFit
                        .cover, // Rellena el contenedor, cortando si es necesario
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 350.0,
                        width: MediaQuery.of(context).size.width * 0.85,
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.movie_filter,
                          color: Colors.grey,
                          size: 80,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // --- Contenido de la Reseña ---
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Column(
                // CAMBIO: Alineación a la izquierda
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- CAMBIO: Sección de Calificación Minimalista ---
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      // Alinear el texto por la base
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Icon(
                          Icons.star,
                          color: kGoldColor,
                          size: 32,
                        ), // Icono más grande
                        const SizedBox(width: 8),
                        // Usamos RichText para dos estilos de texto
                        RichText(
                          text: TextSpan(
                            // Estilo base (para el número grande)
                            style: const TextStyle(
                              color: Color.fromARGB(
                                255,
                                255,
                                255,
                                255,
                              ), // Color de texto oscuro
                              fontSize: 30, // Mucho más grande
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              // Número de calificación
                              TextSpan(text: calificacion.toString()),
                              // Sufijo "/ 10" más pequeño y sutil
                              TextSpan(
                                text: ' / 10',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    249,
                                    234,
                                    234,
                                  ), // Color más sutil
                                  fontSize: 18, // Más pequeño
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),

                  // --- CAMBIO: Título "Crítica Completa" con Icono ---
                  Row(
                    children: [
                      Icon(
                        Icons.notes, // Icono de reseña
                        color: const Color.fromARGB(
                          255,
                          246,
                          244,
                          244,
                        ).withOpacity(0.7),
                        size: 26,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Crítica Completa',
                        style: TextStyle(
                          color: const Color.fromARGB(
                            255,
                            252,
                            249,
                            249,
                          ).withOpacity(0.9),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey[300], thickness: 1, height: 20),
                  const SizedBox(height: 10),

                  // --- CAMBIO: Texto de la Crítica (Justificado) ---
                  Text(
                    critica,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 16,
                      height: 1.7, // Más interlineado
                    ),
                    // CAMBIO: Texto Justificado
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 40), // Espacio al final
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
