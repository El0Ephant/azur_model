import 'package:dddemo/model/viewer_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class MainModel extends StatefulWidget {
  const MainModel(
      {super.key, required this.asset, this.viewerType = ViewerType.gif});

  final String asset;
  final ViewerType viewerType;

  @override
  State<MainModel> createState() => _MainModelState();
}

class _MainModelState extends State<MainModel> with TickerProviderStateMixin {
  late FlutterGifController gifController;

  @override
  void initState() {
    gifController = FlutterGifController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      gifController.repeat(
        min: 0,
        max: 46,
        period: const Duration(milliseconds: 3000),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.viewerType) {
      case ViewerType.glb:
        return ModelViewer(
          key: ValueKey(widget.asset),
          src: widget.asset,
          backgroundColor: Colors.black,
        );
      case ViewerType.gif:
        return GifImage(
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitHeight,
          image: AssetImage(widget.asset),
          controller: gifController,
        );
      default:
        return const Text("Unknown viewer type");
    }
  }
  @override
  void dispose() {
    gifController.dispose();
    super.dispose();
  }
}
