import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class PartPage extends StatefulWidget {
  const PartPage(
      {super.key,
      required this.title,
      this.schemeImage,
      required this.defaultAsset,
      this.partsMap = const {},
      this.documentation = ""});

  final String title;
  final String? schemeImage;
  final String defaultAsset;
  final Map<String, String> partsMap;
  final String documentation;

  @override
  State<PartPage> createState() => _PartPageState();
}

class _PartPageState extends State<PartPage> {
  String? currentAsset;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    const buttonText = TextStyle(
      fontSize: 24,
      color: Colors.black,
    );
    final buttonTheme = ElevatedButton.styleFrom(backgroundColor: Colors.white);
    final partsTitles = widget.partsMap.keys.toList();
    final partsAssets = widget.partsMap.values.toList();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: AppBar().preferredSize.height,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: buttonTheme,
                    child: const Text(
                      "К схеме",
                      style: buttonText,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                        context: context,
                        builder: (BuildContext context) => Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 30,
                            horizontal: 20,
                          ),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.documentation,
                            ),
                          ),
                        ),
                      );
                    },
                    style: buttonTheme,
                    child: const Text(
                      "Документация",
                      style: buttonText,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  child: Container(
                    color: Colors.black,
                    height: height / 3,
                    width: width,
                    child: Stack(
                      children: [
                        const Center(
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          ),
                        ),
                        ModelViewer(
                          key: ValueKey(currentAsset ?? widget.defaultAsset),
                          src: currentAsset ?? widget.defaultAsset,
                          backgroundColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              if (widget.schemeImage != null)
                Image.asset(
                  widget.schemeImage!,
                ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      setState(
                        () {
                          if (currentAsset != partsAssets[i]) {
                            currentAsset = partsAssets[i];
                          } else {
                            currentAsset = widget.defaultAsset;
                          }
                        },
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: currentAsset == partsAssets[i]
                          ? Colors.red
                          : Colors.black,
                    ),
                    child: Text(
                      "${i + 1}. ${partsTitles[i]}",
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                itemCount: partsTitles.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
