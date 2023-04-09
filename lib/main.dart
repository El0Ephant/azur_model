import 'package:dddemo/azur_page.dart';
import 'package:dddemo/part_page.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          "ИП-3": () => MaterialPageRoute(
                builder: (_) => const PartPage(
                  title: 'Блок "ИП-3"',
                  defaultAsset: "assets/models/IP3.glb",
                  partsMap: {
                    // TODO (фидя) доделать 3D модельки и схемы
                    "Канальный фильтр": "assets/models/IP3_KF.glb",
                    "НЧ": "assets/models/IP3_NCh.glb",
                    "Регулятор": "assets/models/IP3_NCh.glb",
                    "Усилитель": "assets/models/IP3_UsK.glb",
                    "Демодулятор (ИД)": "assets/models/IP3_KF.glb",
                    "Резисторы": "assets/models/IP3_res.glb",
                  },
                  defaultMicroScheme: "assets/images/micro_schema/ip3_ms.jpg",
                  defaultElectricScheme:
                      "assets/images/electric_schema/ip3_es.jpg",
                  documentation:
                      '''Индивидуальное оборудование тракта приема предназначено для преобразования спектра сигналов в диапазоне частот 132,4 - 143,4 кГц в спектр низкочастотных сигналов в диапазоне частот 0,3-3,4 кГц''',
                ),
              ),
          "КНЧО": null,
          "ПЕР": null,
          "КУ": null // TODO (Фидя) Дописать заглушки остальных блоков
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
