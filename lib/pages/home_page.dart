import 'package:art_gallery/pages/artistas_page.dart';
import 'package:art_gallery/pages/detalhes_artista_page.dart';
import 'package:art_gallery/pages/detalhes_obra_page.dart';
import 'package:art_gallery/pages/exposicoes_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffFDFBF6),

      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Container(
          color: Color(0xffC0A062),
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black87,
                      size: 30,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(height: 20),
                // Chamamos a função passando o context
                _buildMenuItem(Icons.search, "Explorar", context),
                _buildMenuItem(Icons.person_outline, "Artistas", context),
                _buildMenuItem(
                  Icons.collections_outlined,
                  "Exposições",
                  context,
                ),
                _buildMenuItem(Icons.list_alt, "Minha Coleção", context),
                _buildMenuItem(Icons.star_border, "Favoritos", context),
                _buildMenuItem(
                  Icons.settings_outlined,
                  "Configurações",
                  context,
                ),
                _buildMenuItem(Icons.dark_mode_outlined, "Mudar Tema", context),
              ],
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Barra de Busca
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Color(0xffF1EEE9),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    icon: GestureDetector(
                      onTap: () => _scaffoldKey.currentState?.openDrawer(),
                      child: Icon(Icons.menu, color: Colors.black54),
                    ),
                    suffixIcon: Icon(Icons.search, color: Colors.black54),
                    hintText: "Pesquisar Obras...",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 30),

              Text(
                "Obras em destaque",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Georgia",
                ),
              ),
              SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navegação para Detalhes
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalhesObraPage(),
                              ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              'https://pixnio.com/free-images/2025/10/01/2025-10-01-07-30-17-1344x896.jpeg',
                              fit: BoxFit.cover,
                              height: 120,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Beija Flor (1976)",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQilreu-_6jKyjR3LKQrE4XkWVdxC-0qV-Y7w&s',
                            fit: BoxFit.cover,
                            height: 120,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "O Sol (2008)",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),

              Text(
                "Exposições Atuais",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Georgia",
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/exhibition_banner_1.jpg',
                    ), // Exemplo Network
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 40),

              Text(
                "Artistas para Descobrir",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Georgia",
                ),
              ),
              SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetalhesArtistaPage(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSPgfaqyOkDpPrSY_V7-6tneoOva_mj1WEpg&s',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _buildArtistItem(
                    'https://upload.wikimedia.org/wikipedia/commons/9/98/Pablo_picasso_1.jpg',
                  ),
                  _buildArtistItem(
                    'https://www.cartacapital.com.br/wp-content/uploads/2019/02/Kombo-Leonardo-Da-Vinci-und-Leonardo-di-Caprio-1024x1001.jpg',
                  ),
                  _buildArtistItem(
                    'https://upload.wikimedia.org/wikipedia/commons/f/f6/Raffaello_Sanzio.jpg',
                  ),
                  _buildArtistItem(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNrAnlNK3bpil0Ry-rkwKLGBzSUvpXeA9XHg&s',
                  ),
                  _buildArtistItem(
                    'https://static.mundoeducacao.uol.com.br/mundoeducacao/2019/12/1-frida-kahlo.jpg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        if (title == "Artistas") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ArtistsPage()),
          );
        } else if (title == "Exposições") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExposicoesPage()),
          );
        }
      },
    );
  }

  Widget _buildArtistItem(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[300],
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
