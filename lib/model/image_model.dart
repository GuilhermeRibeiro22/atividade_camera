import 'dart:io';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class ImageModel {
  File? imageFile;
  final ImagePicker picker = ImagePicker();

  // Método para capturar imagem da câmera
  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path); 
    }
  }

  // Método para salvar a imagem na galeria
  Future saveImage() async {
    if (imageFile != null) {
      final result = await GallerySaver.saveImage(imageFile!.path);
      return result;
    }
    return null;
  }
}
