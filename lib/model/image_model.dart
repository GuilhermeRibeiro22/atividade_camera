import 'dart:io';

// Classe para salvar um arquivo ou ser Null
class ImageModel {
  File? imageFile;

// Método
  void setImage(File file) {
    imageFile = file;
  }
}
