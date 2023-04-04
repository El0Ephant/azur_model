import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class AzurPage extends StatelessWidget {
  const AzurPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModelViewer(
        src: 'assets/models/Azur.glb',
        backgroundColor: Colors.black,
      ),
    );
  }

}