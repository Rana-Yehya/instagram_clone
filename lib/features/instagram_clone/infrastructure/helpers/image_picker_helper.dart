import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/core/extensions/xfile_to_file.dart';

class ImagePickerHelper {
  static final ImagePicker _imagePicker = ImagePicker();

  static Future<File?> pickImageFromGallery() =>
      _imagePicker.pickImage(source: ImageSource.gallery).toFile();

  static Future<File?> pickVideoFromGallery() =>
      _imagePicker.pickVideo(source: ImageSource.gallery).toFile();
}
