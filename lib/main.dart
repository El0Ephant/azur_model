import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viewer demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("АЗУР"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Документация",
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Визуализация",
            ),
          ),
          ModelViewer(
            src: 'assets/models/Azur.glb',
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
