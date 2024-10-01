import 'package:flutter/material.dart';
import '../controller/image_controller.dart';
import '../model/image_model.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ImageModel model = ImageModel();
  late final ImageController controller;

  @override
  void initState() {
    super.initState();
    controller = ImageController(model);
  }

  Future<void> _saveImage() async {
    final result = await controller.saveImage();
    if (result != null && result) {
      _showDialog('Sucesso', 'Imagem salva na galeria!', true);
    } else if (result == null) {
      _showDialog('Atenção', 'Nenhuma imagem para salvar!', false);
    } else {
      _showDialog('Erro', 'Erro ao salvar imagem.', false);
    }
  }

  // Função para mostrar o AlertDialog
  void _showDialog(String title, String message, bool success) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Câmera e Salvamento de Fotos', style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: model.imageFile == null
                    ? Text('Nenhuma imagem selecionada.')
                    : Image.file(model.imageFile!),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  await controller.getImageFromCamera();
                  setState(() {}); // Atualiza a interface após capturar a imagem
                },
                child: Text('Abrir Câmera'),
              ),
              ElevatedButton(
                onPressed: _saveImage,
                child: Text('Salvar Foto na Galeria'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
