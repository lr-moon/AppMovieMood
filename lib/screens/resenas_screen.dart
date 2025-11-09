import 'package:flutter/material.dart';

// --- ¡ÚNICO CAMBIO IMPORTANTE! ---
// Importamos la nueva pantalla de detalle.
import 'resena_detalle_screen.dart';

// --- Definición del Widget de la Pantalla de Reseñas ---
// (Tu código original)
class ResenasScreen extends StatelessWidget {
  const ResenasScreen({super.key});

  // --- Fuente de Datos ---
  // (Tu código original)
  final List<Map<String, dynamic>> listaDeResenas = const [
    {
      'titulo': 'Oppenheimer',
      'critica':
          'Un drama biográfico monumental y absorbente de Christopher Nolan. La película es un logro técnico y narrativo, con una actuación central hipnótica de Cillian Murphy que explora la complejidad del creador de la bomba atómica.',
      'calificacion': 9.0,
      'imagenAsset': 'assets/images/R1.jpg',
    },
    {
      'titulo': 'Dune',
      'critica':
          'Una adaptación épica y visualmente sobrecogedora de la novela de ciencia ficción. Denis Villeneuve construye un mundo inmersivo y grandioso, sentando las bases de una saga con una escala y una ambición impresionantes.',
      'calificacion': 8.6,
      'imagenAsset': 'assets/images/R2.jpg',
    },
    {
      'titulo': 'Barbie',
      'critica':
          'Una película sorprendentemente ingeniosa, divertida y con un mensaje poderoso. Greta Gerwig ofrece una sátira colorida y existencial que deconstruye el ícono de Barbie con humor y corazón, celebrando la feminidad en todas sus formas.',
      'calificacion': 8.5,
      'imagenAsset': 'assets/images/R3.jpg',
    },
    {
      'titulo': 'Los Vengadores',
      'critica':
          'El épico crossover que culminó años de construcción del universo Marvel. Joss Whedon equilibra a la perfección la acción espectacular con el humor y la dinámica entre sus héroes, creando un evento cinematográfico inolvidable.',
      'calificacion': 8.7,
      'imagenAsset': 'assets/images/R4.jpg',
    },
    {
      'titulo': 'Avatar',
      'critica':
          'Una revolución visual que transportó a los espectadores a un mundo alienígena exuberante y detallado. La historia de James Cameron, aunque sencilla, es un espectáculo épico que redefinió el cine en 3D y sigue siendo un hito tecnológico.',
      'calificacion': 8.8,
      'imagenAsset': 'assets/images/R5.jpg',
    },
    {
      'titulo': 'El Conjuro',
      'critica':
          'James Wan revitalizó el género de casas embrujadas con esta obra maestra del terror. Basada en un caso real, la película utiliza una tensión magistral y sustos genuinamente aterradores para crear una experiencia escalofriante.',
      'calificacion': 8.1,
      'imagenAsset': 'assets/images/R6.jpg',
    },
    {
      'titulo': 'It (Eso)',
      'critica':
          'Una adaptación aterradora y sorprendentemente emotiva de la novela de Stephen King. La película captura el horror de Pennywise a la vez que explora los lazos de amistad del Club de los Perdedores, con un elenco joven excepcional.',
      'calificacion': 7.9,
      'imagenAsset': 'assets/images/R7.jpg',
    },
    {
      'titulo': 'Star Wars: Una Nueva Esperanza',
      'critica':
          'La película que cambió la ciencia ficción para siempre. Una aventura espacial clásica de bien contra el mal que introdujo a personajes icónicos, un universo fascinante y encendió la imaginación de generaciones enteras.',
      'calificacion': 8.6,
      'imagenAsset': 'assets/images/R8.jpg',
    },
    {
      'titulo': 'Los Juegos del Hambre',
      'critica':
          'Una emocionante adaptación de la popular novela distópica. Jennifer Lawrence brilla como Katniss Everdeen en una historia que combina acción trepidante con una potente crítica social sobre la desigualdad y el entretenimiento.',
      'calificacion': 7.8,
      'imagenAsset': 'assets/images/R9.jpg',
    },
    {
      'titulo': 'Shrek',
      'critica':
          'Una brillante y divertida parodia de los cuentos de hadas tradicionales. Con un humor ingenioso que apela tanto a niños como a adultos, Shrek se convirtió en un clásico instantáneo de la animación, lleno de personajes memorables.',
      'calificacion': 8.3,
      'imagenAsset': 'assets/images/R10.jpg',
    },
    {
      'titulo': 'Cómo Entrenar a tu Dragón',
      'critica':
          'Una conmovedora y visualmente espectacular película animada sobre la amistad entre un joven vikingo y un dragón. Es una aventura llena de corazón, humor y secuencias de vuelo que te dejarán sin aliento.',
      'calificacion': 8.5,
      'imagenAsset': 'assets/images/R11.jpg',
    },
    {
      'titulo': 'Orgullo y Prejuicio',
      'critica':
          'Una adaptación cinematográfica encantadora y visualmente impresionante de la novela clásica de Jane Austen. La química entre Keira Knightley y Matthew Macfadyen captura a la perfección la tensión y el romance de la historia.',
      'calificacion': 8.2,
      'imagenAsset': 'assets/images/R12.jpg',
    },
    {
      'titulo': 'Yo Antes de Ti',
      'critica':
          'Un drama romántico profundamente emotivo que explora temas complejos con sensibilidad. La química entre Emilia Clarke y Sam Claflin es el corazón de esta historia agridulce que te hará reír y llorar.',
      'calificacion': 7.9,
      'imagenAsset': 'assets/images/R13.jpg',
    },
    {
      'titulo': 'Los Imprevistos del Amor',
      'critica':
          'Una encantadora y a menudo divertida comedia romántica sobre dos mejores amigos cuyo destino parece jugarles una mala pasada una y otra vez. Es una historia sobre el tiempo, las oportunidades perdidas y el amor verdadero.',
      'calificacion': 7.6,
      'imagenAsset': 'assets/images/R14.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      // --- Barra de Aplicación (AppBar) ---
      // (Tu código original)
      appBar: AppBar(
        title: const Text('Reseñas Publicadas'),
        backgroundColor: const Color(0xFF8B2E41), // Color corporativo.
        foregroundColor: Colors.white,
        elevation: 0, // Sin sombra.
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Buscar reseña',
            onPressed: () => print('Botón de búsqueda presionado'),
          ),
        ],
      ),
      // --- Cuerpo de la Pantalla ---
      // (Tu código original)
      body: CustomScrollView(
        slivers: <Widget>[
          // 1. Widget del encabezado (Banner + Títulos).
          const _HeaderResenas(),

          // 2. Widget de la lista de reseñas.
          SliverList.builder(
            itemCount: listaDeResenas.length, // Total de elementos en la lista.
            itemBuilder: (context, index) {
              final resena = listaDeResenas[index]; // Obtiene la reseña actual.
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                // --- ¡CAMBIO AQUÍ! ---
                // Envolvemos tu tarjeta en un InkWell para que sea "tocable"
                child: InkWell(
                  borderRadius: BorderRadius.circular(15.0),
                  // --- ¡Y LE DAMOS LA ACCIÓN DE NAVEGAR! ---
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResenaDetalleScreen(
                          // Le pasamos los datos de ESTA reseña
                          // Usamos 'as double' para asegurar el tipo de dato
                          titulo: resena['titulo'],
                          critica: resena['critica'],
                          calificacion: resena['calificacion'] as double,
                          imagenAsset: resena['imagenAsset'],
                        ),
                      ),
                    );
                  },
                  // (Fin del cambio)
                  // Utiliza el widget reutilizable ResenaCard para mostrar los datos.
                  child: ResenaCard(
                    titulo: resena['titulo'],
                    critica: resena['critica'],
                    calificacion: resena['calificacion'] as double,
                    imagenAsset: resena['imagenAsset'], // Pasa la ruta local.
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// --- WIDGET PRIVADO: Encabezado de la pantalla ---
// (Tu código original)
class _HeaderResenas extends StatelessWidget {
  const _HeaderResenas();

  @override
  Widget build(BuildContext context) {
    // SliverToBoxAdapter permite usar un widget normal (como Column)
    // dentro de un CustomScrollView.
    return SliverToBoxAdapter(
      child: Column(
        children: [
          // --- Banner de Imagen de fondo ---
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/image1.jpg',
                ), // Carga imagen local.
                fit: BoxFit.cover, // La imagen cubre todo el contenedor.
              ),
            ),
          ),

          // --- Título principal ---
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
            child: Text(
              'Explora el mundo del cine',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Georgia',
              ),
            ),
          ),

          // --- Subtítulo ---
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0, 16.0, 20.0),
            child: Text(
              'Las últimas opiniones de nuestros críticos',
              style: TextStyle(color: Colors.white70, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

// --- Widget reutilizable para cada Tarjeta de Reseña ---
// (Tu código original)
class ResenaCard extends StatelessWidget {
  final String titulo;
  final String critica;
  final double calificacion;
  final String imagenAsset; // Recibe la ruta de la imagen local.

  const ResenaCard({
    Key? key,
    required this.titulo,
    required this.critica,
    required this.calificacion,
    required this.imagenAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF2C2C2E),
      margin: const EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      clipBehavior:
          Clip.antiAlias, // Recorta el contenido a la forma de la tarjeta.
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // --- Imagen de la Película ---
          // Carga la imagen desde los assets del proyecto.
          Image.asset(
            imagenAsset,
            width: 100,
            height: 150,
            fit: BoxFit.cover,
            // Muestra un ícono de error si la imagen no se carga correctamente.
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 100,
                height: 150,
                color: Colors.black26,
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.white54,
                  size: 40,
                ),
              );
            },
          ),
          // --- Contenido de Texto ---
          // Expanded permite que la columna de texto ocupe el espacio restante.
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // El título puede expandirse si es largo.
                      Expanded(
                        child: Text(
                          titulo,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // --- Calificación con Estrella ---
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            calificacion.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // --- Crítica de la Película ---
                  Text(
                    critica,
                    maxLines: 4, // Limita el texto a 3 líneas.
                    overflow: TextOverflow
                        .ellipsis, // Añade "..." si el texto es muy largo.
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.4, // Espaciado entre líneas.
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
