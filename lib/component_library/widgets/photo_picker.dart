import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:interesting_places/component_library/component_library.dart';

class PhotoPicker extends StatelessWidget {
  const PhotoPicker({
    super.key,
    required this.add,
    required this.delete,
    required this.images,
  });

  final VoidCallback add;
  final ValueSetter delete;
  final List<Uint8List> images;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      children: [
        SizedBox(
          width: 72,
          height: 72,
          child: OutlinedButton(
            onPressed: add,
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: colors.secondary,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Icon(
              Icons.add,
              color: colors.secondary,
              size: 40,
            ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 264,
          height: 72,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 16);
            },
            itemBuilder: (context, index) {
              return SizedBox(
                width: 72,
                height: 72,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Center(
                        child: Image.memory(
                          images[index],
                          width: 72,
                          height: 72,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4, top: 4),
                        child: InkWell(
                          onTap: () => delete(index),
                          child: Icon(
                            Icons.cancel,
                            color: colors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
