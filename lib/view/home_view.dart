import 'package:flutter/material.dart';
import '../controller/image_controller.dart';
import '../model/image_model.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
   final ImageController controller = ImageController();

  @override
  
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
                child: controller.camera.imageFile == null
                    ? Text('Nenhuma imagem selecionada.')
                    : Image.file(controller.camera.imageFile!),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  await controller.abrirCamera();
                  setState(() {});
                },
                child: Text('Abrir Câmera'),
              ),
              ElevatedButton(
                onPressed: () async {
                  await controller.salvarFoto();
                  setState(() { });
                },
                child: Text('Salvar Foto na Galeria'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
