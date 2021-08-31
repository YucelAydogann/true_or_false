import 'package:flutter/material.dart';

AppBar appsbar(){
  return AppBar(
    backgroundColor: Colors.black,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu),
        Text("Genel Kültür"),
        Icon(Icons.exit_to_app),
      ],
    ),
  );
}