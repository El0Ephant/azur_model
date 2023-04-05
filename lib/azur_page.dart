import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class AzurPage extends StatelessWidget {
  const AzurPage({
    super.key,
    this.partsMap = const {},
    this.documentation = "",
    required this.asset,
  });

  final String asset;
  final Map<String, MaterialPageRoute Function()?> partsMap;
  final String documentation;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final partsTitles = partsMap.keys.toList();
    final routes = partsMap.values.toList();

    const buttonText = TextStyle(
      fontSize: 24,
      color: Colors.black,
    );

    final buttonTheme = ElevatedButton.styleFrom(backgroundColor: Colors.white);
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
                          documentation,
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
                          key: ValueKey(asset),
                          src: asset,
                          backgroundColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Text(
                "АЗУР-6",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) => Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      if (routes[i] != null) {
                        Navigator.push(context, routes[i]!());
                      }
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
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
