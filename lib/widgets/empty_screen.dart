import 'package:flutter/material.dart';
import 'package:shop_app2/inner_screens/feeds_screen.dart';
import 'package:shop_app2/services/global_methods.dart';
import 'package:shop_app2/widgets/text_widget.dart';

import '../services/utils.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.buttonText})
      : super(key: key);
  final String imagePath, title, subtitle, buttonText;

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final color = Utils(context).color;
    final ThemeState = Utils(context).getTheme;

    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              height: size.height * 0.4,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Oops!',
              style: TextStyle(
                  color: Colors.red, fontSize: 40, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: title,
              color: Colors.cyan,
              textSize: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: subtitle,
              color: Colors.cyan,
              textSize: 20,
            ),
            SizedBox(
              height: size.height * 0.15,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    primary: Colors
                        .black12, //Theme.of(context).colorScheme.secondary,
                    onPrimary: color,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700)),
                onPressed: () {
                  GlobalMethods.navigateTo(
                      ctx: context, routeName: FeedsScreen.routeName);
                },
                child: TextWidget(
                  text: buttonText,
                  textSize: 20,
                  color:
                      ThemeState ? Colors.grey.shade300 : Colors.grey.shade800,
                  isTitle: true,
                ))
          ],
        ),
      )),
    );
  }
}
