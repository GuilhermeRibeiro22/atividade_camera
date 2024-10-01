import 'package:camera/model/image_model.dart';

class ImageController {
  final ImageModel camera =ImageModel();

// Caso uma imagem seja capturada ela é passada para o model através do setImage
  Future abrirCamera() async {
     await camera.getImageFromCamera();
     return camera.imageFile?.path;
    }
  

  Future salvarFoto() async {
    final salvar = await camera.saveImage();
    return salvar;
    
  }
}
