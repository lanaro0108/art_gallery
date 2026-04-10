import 'package:flutter/material.dart';

class DetalhesObraPage extends StatefulWidget {
  DetalhesObraPage({super.key});

  @override
  State<DetalhesObraPage> createState() => _DetalhesObraPageState();
}

class _DetalhesObraPageState extends State<DetalhesObraPage> {
  // Estado para o botão de favorito
  bool isFavorite = false;

  // Lista fictícia de coleções
  List<String> minhasColecoes = ["Arte Moderna"];

  // Função para o Modal de Coleção
  void _abrirModalColecao() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Adicionar à Coleção",
            style: TextStyle(fontFamily: "Georgia"),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...minhasColecoes.map(
                  (colecao) => ListTile(
                    leading: Icon(Icons.folder_outlined),
                    title: Text(colecao),
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Adicionado a: $colecao")),
                      );
                    },
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.add, color: Colors.blue),
                  title: Text(
                    "Criar Nova Coleção",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    // Aqui você implementaria a lógica de criar nova
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDFBF6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // FUNCIONALIDADE: VOLTAR (Navigator.pop)
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Detalhes da Obra",
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Georgia",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Beija Flor",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Georgia",
                ),
              ),
            ),
            SizedBox(height: 20),

            // Imagem Principal
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    'https://pixnio.com/free-images/2025/10/01/2025-10-01-07-30-17-1344x896.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Icon(Icons.zoom_in, color: Colors.black, size: 30),
                ),
              ],
            ),

            SizedBox(height: 20),
            Text(
              "Arnaldo de Matos • 1976",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 15),
            Text(
              "A obra une a precisão da ilustração científica à estética vibrante dos anos 70.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            SizedBox(height: 30),

            // BOTÃO: MUSEU
            _buildActionButton(
              Icons.location_on,
              "Museu de Arte Contemporânea",
              const Color(0xffA6A6A6),
              () {},
            ),
            SizedBox(height: 12),

            // FUNCIONALIDADE: SALVAR NOS FAVORITOS (Toggle Estado)
            _buildActionButton(
              isFavorite ? Icons.star : Icons.star_border,
              isFavorite ? "Favoritado!" : "Salvar como Favorito",
              const Color(0xffB9955B),
              () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),
            SizedBox(height: 12),

            _buildActionButton(
              Icons.bookmark_border,
              "Adicionar à Coleção",
              const Color(0xffC08491),
              _abrirModalColecao,
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
            SizedBox(width: 10),
            Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
