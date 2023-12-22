import 'package:flutter/material.dart';

import 'colors_app.dart';

Widget CustomAppBar({String label = 'News App', bool isBackButton = false}) {
  return AppBar(
    backgroundColor: ColorsApp.primaryColor,
    elevation: 2,
    centerTitle: false,
    title: Text(
      label,
      style: TextStyle(
          color: ColorsApp.blackColor, fontWeight: FontWeight.w700, fontSize: 20),
    ),
  );
}
