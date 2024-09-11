import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/pixabay_image.dart';

class FullScreenImage extends StatelessWidget {
  final PixabayImage image;

  const FullScreenImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Hero(
          tag: image.imageUrl,
          child: CachedNetworkImage(
            imageUrl: image.imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
