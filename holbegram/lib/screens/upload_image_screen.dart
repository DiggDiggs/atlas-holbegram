import 'package:flutter/material.dart';

class UploadImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Image')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Upload Image Page'),
            // Add functionality for image uploading here
          ],
        ),
      ),
    );
  }
}
