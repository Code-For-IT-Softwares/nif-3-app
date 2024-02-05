import 'package:flutter/material.dart';
import 'package:nif_web/services/network/image_service.dart';

class ImageViewPage extends StatelessWidget {
  final filePath;
  const ImageViewPage({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Image View")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Center(
          child: Image.network(fetchImageUrl(filePath)),
        ),
      ),
    );
  }
}
