import 'dart:convert';

import 'package:dddemo/azur_page.dart';
import 'package:dddemo/model/json_provider.dart';
import 'package:dddemo/model/part_model.dart';
import 'package:dddemo/part_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var jsonProvider = JsonProvider();
  jsonProvider.values["IP3"] =
      await rootBundle.loadString("assets/json/IP3.json");
  jsonProvider.values["IP3_repair"] =
  await rootBundle.loadString("assets/json/IP3_repair.json");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final jsonProvider = JsonProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viewer demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey,
      ),
      home: AzurPage(
        asset: "assets/models/AZUR.glb",
        partsMap: {
          "ИП-3": () => MaterialPageRoute(
                builder: (_) => PartPage(
                  model: PartModel.fromJson(
                    jsonDecode(jsonProvider.values["IP3"]!),
                  ),
                  repairRoute: () => MaterialPageRoute(
                    builder: (_) => PartPage.repair(
                      model: PartModel.fromJson(
                        jsonDecode(
                            jsonProvider.values["IP3_repair"]!),
                      ),
                    ),
                  ),
                ),
              ),
          "КНЧО": null,
          "ПР-1": null,
          "ПР-2": null,
          "Г-1": null,
          "Г-2": null,
          "ЗГ": null,
          "ПЕР": null,
          "ПИТ": null,
          "СН": null,
          "ПВУ": null,
          "КСС": null,
          "АРУ": null,
          "ЗИП-3": null,
          "КУ": null
        },
        documentation:
            '''Аппаратура системы передачи П-330-6 предназначена для уплотнения радиорелейных, тропосферных и кабельных линий типа П-296, П-268 и образования шести каналов тональной частоты в диапазоне частот от 4,6 до 31,7 кГц.
              П-330-6 полностью обеспечивает встречную работу с аппаратурой П-303.
              Устройств дистанционного питания аппаратура П-330-6 не имеет.
              Аппаратура предназначена для эксплуатации на узлах связи в условиях изменения температуры от -30 С до +50 С, относительной влажности до 98 %, атмосферного давления не ниже 460 мм ртутного столба.
              
              В аппаратуре П-330-6 предусмотрены следующие типы каналов:
              1. каналы ТЧ с эффективно передаваемой полосой частот 0,3-3,4кГц - 6 каналов;
              2. канал ШК с эффективно передаваемой полосой частот 12,3-23,4 кГц - 1 канал;
              3.канал КСС с эффективно передаваемой полосой частот 0,3-2,4кГц - 1 канал.''',
      ),
    );
  }
}
