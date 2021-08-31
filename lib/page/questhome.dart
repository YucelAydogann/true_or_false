import 'package:flutter/material.dart';
import 'package:true_or_false/utilities/quests.dart';
import 'package:true_or_false/widgets/buttons.dart';
import 'package:cool_alert/cool_alert.dart';
import 'dart:ui';

QuestCalc quesCalc = QuestCalc();

class QuestHome extends StatefulWidget {
  @override
  _QuestHomeState createState() => _QuestHomeState();
}

class _QuestHomeState extends State<QuestHome> {
  void CheckAnswer(bool userPickedAnswer) {
    bool correctAnswer = quesCalc.getAnswer();

    setState(() {
      if (quesCalc.isFinished() == true) {
        if (userPickedAnswer == correctAnswer) {
          bottomTicks.add(Icon(Icons.check_circle, color: Colors.green, size: 25,));
        } else {
          bottomTicks.add(Icon(Icons.remove_circle, color: Colors.red, size: 25,));
        }
        CoolAlert.show(
            confirmBtnText: 'Sıfırla', title: 'Genel Kültür Bitti',
            context: context,  type: CoolAlertType.success,
            text: 'Tebrikler. Tüm soruları cevapladınız',
            barrierDismissible: false,
            onConfirmBtnTap: () {
              setState(() {
                quesCalc.reset();
                bottomTicks = [];
                Navigator.pop(context, true);
              });
            });
      }
      else {
        if (userPickedAnswer == correctAnswer) {
          bottomTicks.add(Icon(Icons.check_circle, color: Colors.green, size: 25, ));
        } else {
          bottomTicks.add(Icon(Icons.remove_circle, color: Colors.red, size: 25,)); }
        quesCalc.nextQuest();
      }
    });
  }

  List<Icon> bottomTicks = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 10,
            child: Padding(
              padding: EdgeInsets.fromLTRB(40,40,40,20),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(40),
                  child: Text(
                    quesCalc.getText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            )),
        Row(
          children: [
            SizedBox(width: 50),
            Buttons(
              onPress: () { setState(() { CheckAnswer(true); });  },
              color: Colors.green.shade600, text: 'Doğru', textcolor: Colors.white,
            ),
            Buttons(
              onPress: () { setState(() { CheckAnswer(false); }); },
              color: Colors.red.shade900, text: 'Yanlış', textcolor: Colors.white,
            ),
            SizedBox(width: 50),
          ],
        ),
        Row(
          children: [
            SizedBox(width: 90),
            Buttons(
              onPress: () {
                setState(() {
                  if (quesCalc.isFinished() == true) {
                    bottomTicks.add(Icon(
                      Icons.album,
                      color: Colors.yellow,
                      size: 25,

                    ));
                    CoolAlert.show(
                        confirmBtnText: 'Sıfırla',  title: 'Genel Kültür Bitti',
                        context: context,  type: CoolAlertType.success,
                        text:'Tebrikler. Tüm soruları cevapladınız.',
                        barrierDismissible: false,
                        onConfirmBtnTap: () {
                          setState(() {
                            quesCalc.reset();
                            bottomTicks = [];
                            Navigator.pop(context, true);
                          });
                        });
                  } else {
                    bottomTicks.add(Icon(
                      Icons.album,
                      color: Colors.yellow,
                      size: 25,
                    ));
                    quesCalc.nextQuest();
                  }
                });
              },
              color: Colors.black38, text: 'Pas', textcolor: Colors.black,
            ),
            SizedBox(width: 90),
          ],
        ),
        Expanded(flex: 1,
            child: Padding(
              padding:const EdgeInsets.fromLTRB(90,5,90,50),
              child: Row(children: bottomTicks)
              ),
            )

      ],
    );
  }
}

