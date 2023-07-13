import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  Quiz quiz = Quiz();

  void checkedAnswer(bool userPickedAnswer) {
    bool correctAnswers = quiz.getQuestionAnswer();

    setState(() {
      if (quiz.isFinished() == true) {
        Alert(
            context: context,
            title: 'Finished!',
            desc: 'You\'ve reached the end of the quiz.',
            buttons: [
              DialogButton(
                color: Color.fromARGB(255, 51, 184, 66),
                child: Text(
                  "Okay",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ]);

        quiz.reset();

        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswers) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Color.fromARGB(255, 51, 184, 66),
            ),
          );
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.clear,
              color: Colors.red,
            ),
          );
        }
        quiz.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkedAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkedAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

class Question {
  late String questionText;
  late bool questionAnswer;
  Question(String q, bool a) {
    questionText = q;
    questionAnswer = a;
  }
}

class Quiz {
  // here we make the questionBank instance to private
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question('Verb falls into two categories: common and proper verb.', false),
    Question('A word that names a person, thing, or place is a noun.', true),
    Question(
        'Conjunction is being used to describe the noun in a sentence.', false),
    Question(
        'Verbs are the words that describe the actions being done in a sentence.',
        true),
    Question('Philippines is an example of an adverb.', false),
    Question('Interjection is a word that is being used to express an emotion.',
        true),
    Question(
        'Adverb is what modifies or describes a verb or another adverb.', true),
    Question('Wow is an example of Interjection.', true),
    Question('Pronoun is what replaces a verb in the sentence..', false),
    Question('Smart is an example of an adjective.', true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      // print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
