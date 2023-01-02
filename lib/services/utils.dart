import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/provider/dark_theme_provider.dart';
import 'package:shop_app2/services/dark_theme_prefs.dart';

class Utils {
  BuildContext context;
  Utils(this.context);

  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;
  Color get color => getTheme ? Colors.white : Colors.black;
  Size get getScreenSize => MediaQuery.of(context)
      .size; //MediaQuery สร้างทรีย่อยที่การสืบค้นสื่อแก้ไขข้อมูลที่กำหนด
}
