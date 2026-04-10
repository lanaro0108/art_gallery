import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDFBF6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color(0xffF1EEE9),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.menu, color: Colors.black54),
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
                        Image.network(
                          'https://png.pngtree.com/thumb_back/fh260/background/20241013/pngtree-beautiful-painting-hummingbirds-are-feeding-on-a-flower-beautifully-illustrated-hovering-image_16352321.jpg',
                          fit: BoxFit.cover,
                          height: 120,
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
                        const SizedBox(height: 8),
                        const Text(
                          "O Sol (2008)",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              const Text(
                "Exposições Atuais",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Georgia",
                ),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 40),

              // --- SEÇÃO: ARTISTAS PARA DESCOBRIR ---
              const Text(
                "Artistas para Descobrir",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Georgia",
                ),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Função auxiliar para criar cada quadro de artista individualmente
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
