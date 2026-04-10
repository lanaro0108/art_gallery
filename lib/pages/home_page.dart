import 'package:art_gallery/pages/detalhes_obra_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Chave para conseguir abrir o Drawer através do ícone no TextField
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Atribui a chave ao Scaffold
      backgroundColor: Color(0xffFDFBF6),

      // --- CONFIGURAÇÃO DO DRAWER (MENU LATERAL) ---
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7, // Ocupa 70% da largura
        child: Container(
          color: Color(0xffC0A062), // Cor dourada do seu print
          child: SafeArea(
            child: Column(
              children: [
                // Botão de voltar (fechar)
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
                // Itens do Menu
                _buildMenuItem(Icons.search, "Explorar"),
                _buildMenuItem(Icons.person_outline, "Artistas"),
                _buildMenuItem(Icons.collections_outlined, "Exposições"),
                _buildMenuItem(Icons.list_alt, "Minha Coleção"),
                _buildMenuItem(Icons.star_border, "Favoritos"),
                _buildMenuItem(Icons.settings_outlined, "Configurações"),
                _buildMenuItem(Icons.dark_mode_outlined, "Mudar Tema"),
              ],
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Color(0xffF1EEE9),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    // Ícone que abre o Drawer
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
              const SizedBox(height: 30),

              const Text(
                "Obras em destaque",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Georgia",
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
  child: Column(
    children: [
      // 1. Envolvemos a imagem com GestureDetector para capturar o clique
      GestureDetector(
        onTap: () {
          // 2. Usamos o Navigator para empilhar a nova página
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  DetalhesObraPage(), // Navega para a classe DetailsPage
            ),
          );
        },
        // 3. Sua imagem original com o ClipRRect para as bordas arredondadas
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(
            'https://pixnio.com/free-images/2025/10/01/2025-10-01-07-30-17-1344x896.jpeg',
            fit: BoxFit.cover,
            height: 120, // Mantive a altura que combinamos antes
          ),
        ),
      ),
      const SizedBox(height: 8),
      const Text(
        "Beija Flor (1976)",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    ],
  ),
),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQilreu-_6jKyjR3LKQrE4XkWVdxC-0qV-Y7w&s',
                          fit: BoxFit.cover,
                          height: 120,
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
                textAlign: TextAlign.center,
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
                  image: const DecorationImage(
                    image: AssetImage('assets/exhibition_banner_1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 40),

              Text(
                "Artistas para Descobrir",
                textAlign: TextAlign.center,
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
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.8,
                children: [
                  _buildArtistItem(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSPgfaqyOkDpPrSY_V7-6tneoOva_mj1WEpg&s',
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
                    'https://static.todamateria.com.br/upload/do/na/donatello-cke.jpg',
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
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
      onTap: () {},
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
