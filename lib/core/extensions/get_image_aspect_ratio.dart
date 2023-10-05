import 'dart:async';

import 'package:flutter/material.dart';

extension GetImageAspectRatio on Image {
  Future<double> getImageAspectRatio() async {
    // Future future = Future(() => null);
    // Find another solution for replacing Completer

    final completer = Completer<double>();

    image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (image, synchronousCall) {
          final aspectRatio = image.image.width / image.image.height;
          image.image.dispose();

          completer.complete(aspectRatio);
        },
      ),
    );
    return completer.future;
  }
}
