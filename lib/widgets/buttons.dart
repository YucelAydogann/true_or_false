import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  Buttons(
      {required this.onPress,
      required this.color,
      required this.text,
      required this.textcolor});
  final Function onPress;
  final Color color;
  final Color textcolor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: FlatButton(
              onPressed: () {
                onPress();
              },
              child: Text(
                text,
                style: TextStyle(color: textcolor, fontSize: 20),
              ),
            ),
          ),
        ));
  }
}
