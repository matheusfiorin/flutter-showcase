import 'package:flutter/material.dart';
import 'package:showcase/pages/home_page.dart';
import 'package:showcase/theme.dart' as theme;

void main() => runApp(
      MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: theme.mainColor,
          cursorColor: theme.mainColor,
        ),
      ),
    );
