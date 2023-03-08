import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:your_eyes/shared/styles/colors.dart';

ThemeData lightTheme=ThemeData(

    appBarTheme: AppBarTheme(
      color: appBarColor,
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    scaffoldBackgroundColor: appBarColor,


);