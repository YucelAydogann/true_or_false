import 'package:flutter/material.dart';
import 'package:true_or_false/page/questhome.dart';
import 'package:true_or_false/widgets/appbar.dart';

void main() {
  runApp(GenelKultur());
}

class GenelKultur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo.shade800,
        appBar: appsbar(),
        body: QuestHome(),
      ),
    );
  }
}
