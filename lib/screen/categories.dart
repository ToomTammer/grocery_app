import 'package:flutter/material.dart';
import 'package:shop_app2/services/utils.dart';
import 'package:shop_app2/widgets/categories_widget.dart';
import 'package:shop_app2/widgets/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  List<Color> gridColor = [
    Colors.red,
    Colors.blue,
    const Color(0xffB7DFF5),
    Colors.green,
    Colors.amber,
    Colors.orange
  ];
  List<Map<String, dynamic>> catInfo = [
    {'imgPath': 'assets/images/im6.png', 'catText': 'Vegetables'},
    {'imgPath': 'assets/images/im6.png', 'catText': 'Fruits'},
    {'imgPath': 'assets/images/im6.png', 'catText': 'Grains'},
    {'imgPath': 'assets/images/im6.png', 'catText': 'Nuts'},
    {'imgPath': 'assets/images/im6.png', 'catText': 'Herbs'},
    {'imgPath': 'assets/images/im6.png', 'catText': 'Spices'},
  ];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context); //เข้าถึงสีใน Utils.dart
    Color color = utils.color; //เข้าถึงสีใน Utils.dart

    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor:
              Theme.of(context).scaffoldBackgroundColor, //BG TOP NAV
          title: TextWidget(
            text: 'Categories',
            color: color,
            textSize: 24,
            isTitle: true,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 240 / 250,
            crossAxisSpacing: 10, //Vertical spacing
            mainAxisSpacing: 10, //Horizontak spacing
            children: List.generate(6, (index) {
              return CategoriesWidget(
                catText: catInfo[index]['catText'],
                imagPath: catInfo[index]['imgPath'],
                passedColor: gridColor[index],
              );
            }),
          ),
        ));
  }
}
