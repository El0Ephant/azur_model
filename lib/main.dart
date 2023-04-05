import 'package:dddemo/azur_page.dart';
import 'package:dddemo/part_page.dart';
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
        scaffoldBackgroundColor: Colors.grey,
      ),
      home: AzurPage(
        asset: "assets/models/Azur.glb",
        partsMap: {
          "ИП-3": ()=>MaterialPageRoute(
            builder: (_) => const PartPage(
              title: 'Блок "ИП-3"',
              defaultAsset: "assets/models/IP3.glb",
              partsMap: {
                "Индивидуальный модулятор (ИМ)": "assets/models/IP3_1.glb",
                "Ограничитель частот (ОГР)": "assets/models/IP3_2.glb",
                "КФпер": "",
                "Резисторы": "",
              },
              schemeImage: "assets/images/ip3_scheme.png",
              documentation:
                  ''' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec massa orci, sollicitudin quis purus vel, rutrum interdum nulla. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris sodales quam non nunc cursus iaculis. Vestibulum ac porttitor lacus. Fusce pulvinar arcu enim, fermentum tincidunt arcu porttitor commodo. Vestibulum sit amet mollis metus, dapibus pharetra sapien. Donec bibendum consequat erat, in congue urna iaculis nec. Suspendisse dolor lacus, elementum ac nibh quis, pellentesque porttitor erat.

                      Vestibulum accumsan massa ac metus sagittis faucibus. Praesent sed orci et tortor semper pharetra id id nibh. Ut imperdiet neque sed feugiat malesuada. Etiam leo nunc, volutpat nec magna vel, placerat mollis lorem. Maecenas id turpis finibus, volutpat sapien a, rutrum diam. Etiam at ultrices sem. Morbi ullamcorper sit amet nisi sed pretium. Sed id venenatis sem. Donec condimentum vel felis et rhoncus. Quisque molestie lorem et augue iaculis, in viverra augue efficitur. Integer ultricies, velit et accumsan efficitur, arcu turpis consequat sem, gravida euismod orci nisl quis elit. In elit tortor, placerat sed elementum consectetur, tempor sit amet diam. Curabitur ac vestibulum velit, in pretium arcu. Nunc mi ex, fringilla a lorem non, vehicula venenatis odio.

                  Ut tempus vitae nulla nec convallis. Duis vel suscipit mauris, ut varius lacus. Donec porttitor molestie ipsum, ac consequat quam blandit eget. Aliquam hendrerit ultrices enim, a aliquet lectus feugiat vel. In ut massa iaculis, imperdiet ligula id, vehicula erat. Ut quam dolor, ultrices non congue a, condimentum non enim. Donec eget enim semper leo tincidunt malesuada. Morbi ornare eros sit amet massa sagittis sodales. Nulla nec gravida nulla. ''',
            ),
          ),
          "КНЧО": null,
          "ПЕР": null,
          "КУ": null,
        },
      ),
    );
  }
}
