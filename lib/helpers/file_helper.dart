import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class FileHelper {
  FileHelper._();

  static FileHelper fileHelper = FileHelper._();

  Future<File> getImage(ImageSource imageSource,String imageName) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    final File file = File(pickedFile.path);
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/$imageName.png';
     File newImage = await file.copy('$path');
    return newImage;
  }



  Future<File> saveImageInDevice(File file,imageName) async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/$imageName.png';
    File newImage = await file.copy('$path');
    return newImage;
  }
}
