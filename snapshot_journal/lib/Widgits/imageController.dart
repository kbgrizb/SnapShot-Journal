import 'dart:io';

class ImageController {
  File? _image;

  File? get image => _image;

  void setImage(File newImage) {
    _image = newImage;
  }

  void clear() {
    _image = null;
  }
}