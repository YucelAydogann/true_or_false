import 'quest_calc.dart';

class QuestCalc {
  int _questNumb = 0;

  List<Question> _questPool = [
    Question(questText: 'Tiyatroda kendi kendine konuşma olarak bilinen türe MONOLOG denir.', questAnswer: true),
    Question(questText: 'Fransız İhtilali 1789-1799 yılları arasında gerçekleşmiştir.', questAnswer: true),
    Question(questText: 'Osmanlı\'da Lale devri III. Selim döneminde yaşanmıştır.', questAnswer: false),
    Question(questText: 'İnönü Zaferi Kurtuluş Savaşı sırasında gerçekleşmiştir.', questAnswer: true),
    Question(questText: 'Kanuni Sultan Süleyman\'nın eşi Kösem Sultan\'dır.', questAnswer: false),
  ];

  void nextQuest() {
    if (_questNumb <= _questPool.length - 1) {
      _questNumb++;
    }
  }

  String getText() {
    return _questPool[_questNumb].questText;
  }

  bool getAnswer() {
    return _questPool[_questNumb].questAnswer;
  }

  bool isFinished() {
    if (_questNumb >= _questPool.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questNumb = 0;
  }
}
