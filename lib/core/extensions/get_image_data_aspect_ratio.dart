import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:instagram_clone/core/extensions/get_image_aspect_ratio.dart';

extension GetImageDataAspectRatio on Uint8List {
  Future<double> getAspectRatio() async {
    final image = Image.memory(this);
    final result = await image.getImageAspectRatio();
    return result;
  }
}
