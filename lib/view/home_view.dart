import 'package:flutter/material.dart';
import '../controller/image_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
   final ImageController controller = ImageController();

  @override
 
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
