import 'dart:typed_data';

import 'package:flutter/material.dart';

class PhotoCarousel extends StatelessWidget {
  const PhotoCarousel({
    super.key,
    required this.images,
  });

  final List<Uint8List> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 360,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.memory(
                images[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ],
      ),
    );
  }
}
