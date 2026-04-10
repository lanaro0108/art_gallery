import 'package:flutter/material.dart';

class ArtistsPage extends StatefulWidget {
  ArtistsPage({super.key});

  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  // Simulação de artistas salvos (IDs ou nomes)
  final Set<String> _artistasSalvos = {};

  void _toggleSalvar(String nome) {
    setState(() {
      if (_artistasSalvos.contains(nome)) {
        _artistasSalvos.remove(nome);
      } else {
        _artistasSalvos.add(nome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDFBF6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Lista de Artistas",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Georgia",
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [Padding(padding: EdgeInsets.only(right: 16))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Text(
                "Artistas Famosos",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Georgia",
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Filtrar por...", style: TextStyle(fontSize: 16)),
                Icon(Icons.filter_list),
                Spacer(),
                Text("Ver Salvos", style: TextStyle(fontSize: 16)),
                SizedBox(width: 8),
                Icon(Icons.bookmark),
              ],
            ),
            SizedBox(height: 30),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.7,
              children: [
                _buildArtistCard(
                  "Pablo Picasso",
                  "Cubismo / Surrealismo",
                  "https://arteref.com/wp-content/uploads/2017/05/Pablo-Picasso-capa.jpg",
                ),
                _buildArtistCard(
                  "Claude Monet",
                  "Pós-Impressionismo",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRD4KT_Fmf3q8IE8D5ljTFWd-2u0PQzJKbVqw&s",
                ),
                _buildArtistCard(
                  "Leonardo da Vinci",
                  "Renascimento",
                  "https://www.cartacapital.com.br/wp-content/uploads/2019/02/Kombo-Leonardo-Da-Vinci-und-Leonardo-di-Caprio-1024x1001.jpg",
                ),
                _buildArtistCard(
                  "Paul Cézanne",
                  "Pós-Impressionismo",
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDfR4gALwiOIPGNWm2wyeHyK8yffOWVvL6jQ&s",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArtistCard(String nome, String estilo, String imageUrl) {
    bool isSaved = _artistasSalvos.contains(nome);

    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: GestureDetector(
                onTap: () => _toggleSalvar(nome),
                child: Container(
                  color: Colors.white,
                  child: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          nome,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          estilo,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}
