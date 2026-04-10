import 'package:flutter/material.dart';

class ExposicoesPage extends StatefulWidget {
  const ExposicoesPage({super.key});

  @override
  State<ExposicoesPage> createState() => _ExposicoesPageState();
}

class _ExposicoesPageState extends State<ExposicoesPage> {
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
          "Próximas Exposições",
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
                "Exposições de arte",
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
                  "Transfiguração",
                  "Le petit Gallery",
                  "https://www.shutterstock.com/shutterstock/photos/1910335603/display_1500/stock-vector-poster-for-art-exhibition-art-fair-and-others-1910335603.jpg",
                ),
                _buildArtistCard(
                  "Art Exhibition",
                  "Grand Hall",
                  "https://www.creativehatti.com/wp-content/uploads/edd/2022/07/Flyer-template-of-the-art-gallery-art-exhibition-11-large.jpg",
                ),
                _buildArtistCard(
                  "The Renaissance",
                  "High Arts",
                  "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/art-exhibition-poster-template-33e5335782c24c54140ead46588c887e_screen.jpg?ts=1636969465",
                ),
                _buildArtistCard(
                  "Sttary Night",
                  "Art House",
                  "https://design-assets.adobeprojectm.com/content/download/express/public/urn:aaid:sc:VA6C2:2d869a84-f2e5-5ab0-864e-ef15b88a4114/component?assetType=TEMPLATE&etag=372faa12ab1a46c19522e0bc9066bd8e&revision=ec21daf6-bd75-440b-b617-67bbb7d8870c&component_id=35b78c65-7b5d-4ee7-b61f-685340cb7a06",
                ),
                _buildArtistCard(
                  "Color & Structure",
                  "Art Expert Gallery",
                  "https://design-assets.adobeprojectm.com/content/download/express/public/urn:aaid:sc:VA6C2:b420df6c-222b-550d-af43-fee86f7a759e/component?assetType=TEMPLATE&etag=0b7119b3852547e485233f164fad858d&revision=e6e168fc-cea0-4b60-b8ad-ac73edd160cd&component_id=90d0cd1e-670c-49db-a3df-e970aa955ea6",
                ),
                _buildArtistCard(
                  "Realism",
                  "Pantheon Gallery",
                  "https://design-assets.adobeprojectm.com/content/download/express/public/urn:aaid:sc:VA6C2:82887a3c-a596-49c7-ba8e-74a92c724b57/component?assetType=TEMPLATE&etag=080531ddf99122802613ff4e00fc7cb3&revision=0&component_id=f56361ee-3b02-41eb-a380-f3793ad19ecc",
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
              borderRadius: BorderRadius.circular(5),
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
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          estilo,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, color: Colors.blueGrey),
        ),
      ],
    );
  }
}
