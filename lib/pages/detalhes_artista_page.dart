import 'package:flutter/material.dart';

class DetalhesArtistaPage extends StatefulWidget {
  DetalhesArtistaPage({super.key});

  @override
  State<DetalhesArtistaPage> createState() => _DetalhesArtistaPageState();
}

class _DetalhesArtistaPageState extends State<DetalhesArtistaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDFBF6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Detalhes do Artista",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Georgia",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Vincent Van Gogh",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Georgia",
                ),
              ),
            ),
            const SizedBox(height: 20),

            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    'https://aventurasnahistoria.com.br/wp-content/uploads/2024/09/van-goghcuriosidades.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                const Positioned(
                  bottom: 10,
                  right: 10,
                  child: Icon(Icons.zoom_in, color: Colors.black, size: 30),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const Text(
              "1853 • 1890",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Text(
              "Considerado uma das figuras mais famosas e influentes da história da arte ocidental, criou mais de dois mil trabalhos ao longo de pouco mais de uma década",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            const SizedBox(height: 30),

            _buildActionButton(
              Icons.location_on,
              "Zundert, Países Baixos",
              const Color(0xffA6A6A6),
              () {
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    IconData icon,
    String text,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black),
            const SizedBox(width: 10),
            Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}