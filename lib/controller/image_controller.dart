import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:camera/model/image_model.dart';

class ImageController {
  final ImageModel model;
  final ImagePicker picker = ImagePicker();

  ImageController(this.model);

// Caso uma imagem seja capturada ela é passada para o model através do setImage
  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      model.setImage(File(pickedFile.path));
    }
  }

  Future<bool?> saveImage() async {
    if (model.imageFile != null) {
      final result = await GallerySaver.saveImage(model.imageFile!.path);
      return result;
    }
    return null;
  }
}
