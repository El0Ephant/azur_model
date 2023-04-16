import 'package:dddemo/model/part_model.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class PartPage extends StatefulWidget {
  const PartPage(
      {super.key,
      required this.model,
      required MaterialPageRoute Function() repairRoute})
      : _route = repairRoute,
        _buttonLabel = "Ремонт";

  const PartPage.repair({super.key, required this.model})
      : _route = null,
        _buttonLabel = "Обзор";

  final PartModel model;
  final MaterialPageRoute Function()? _route;
  final String _buttonLabel;

  @override
  State<PartPage> createState() => _PartPageState();
}

class _PartPageState extends State<PartPage> {
  String? currentPart;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    const buttonText = TextStyle(
      fontSize: 24,
      color: Colors.black,
    );
    final buttonTheme = ElevatedButton.styleFrom(backgroundColor: Colors.white);
    final partsTitles = widget.model.partsMap.keys.toList();
    final partsAssets = widget.model.partsMap.values.toList();
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
                                widget.model.documentationMap[currentPart] ??
                                    widget.model.defaultDocumentation
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
              ElevatedButton(
                onPressed: () {
                  if (widget._route != null) {
                    Navigator.of(context).push(widget._route!());
                  }
                  else {
                    Navigator.pop(context);
                  }
                },
                style: buttonTheme,
                child: Text(
                  widget._buttonLabel,
                  style: buttonText,
                ),
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
                          key: ValueKey(widget.model.partsMap[currentPart] ??
                              widget.model.defaultAsset),
                          src: widget.model.partsMap[currentPart] ??
                              widget.model.defaultAsset,
                          backgroundColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                widget.model.title,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              InteractiveViewer(
                child: Image.asset(
                  widget.model.microSchemeMap[currentPart] ??
                      widget.model.defaultMicroScheme,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InteractiveViewer(
                child: Image.asset(
                  widget.model.electricSchemeMap[currentPart] ??
                      widget.model.defaultElectricScheme,
                ),
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
                          if (widget.model.partsMap[currentPart] !=
                              partsAssets[i]) {
                            currentPart = partsTitles[i];
                          } else {
                            currentPart = null;
                          }
                        },
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor:
                          widget.model.partsMap[currentPart] == partsAssets[i]
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
