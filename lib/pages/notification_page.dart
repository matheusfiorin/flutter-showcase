import 'package:flutter/material.dart';
import 'package:showcase/theme.dart' as theme;

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.mainColor,
        title: Text("Notifications"),
      ),
      body: Center(),
    );
  }
}
