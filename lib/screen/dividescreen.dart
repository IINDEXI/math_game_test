import 'package:flutter/material.dart';
import '../default/default.dart';
import '../componant/question.dart';
import '../componant/question_widget.dart';
import '../componant/next_button.dart';
import '../componant/option_card.dart';
import '../componant/result_box.dart';

class dividescreen extends StatefulWidget {
  const dividescreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _dividescreenState createState() => _dividescreenState();
}

class _dividescreenState extends State<dividescreen> {
  final List<Question> _questions = [
    Question(
      id: '10',
      title: '10 / 2 เท่ากับเท่าไร?',
      options: {'5': true, '2': false, '4': false, '1': false},
    ),
    Question(
      id: '10',
      title: '18 / 3 เท่ากับเท่าไร?',
      options: {'6': true, '8': false, '4': false, '2': false},
    ),
    Question(
      id: '10',
      title: '22 / 22 เท่ากับเท่าไร?',
      options: {'1': true, '3': false, '4': false, '2': false},
    ),
    Question(
      id: '10',
      title: '80 / 4 เท่ากับเท่าไร?',
      options: {'20': true, '30': false, '40': false, '10': false},
    ),
    Question(
      id: '10',
      title: '24 / 2 เท่ากับเท่าไร?',
      options: {'20': false, '10': false, '12': true, '8': false},
    ),
    Question(
      id: '10',
      title: '120 / 5 เท่ากับเท่าไร?',
      options: {'25': false, '21': false, '22': false, '24': true},
    ),
    Question(
      id: '10',
      title: '90 / 9 เท่ากับเท่าไร?',
      options: {'10': true, '20': false, '30': false, '5': false},
    ),
    Question(
      id: '10',
      title: '450 / 25 เท่ากับเท่าไร?',
      options: {'28': false, '18': true, '23': false, '13': false},
    ),Question(
      id: '10',
      title: '600 / 8 เท่ากับเท่าไร?',
      options: {'75': true, '95': false, '55': false, '65': false},
    ),
    Question(
      id: '10',
      title: '300 / 12 เท่ากับเท่าไร?',
      options: {'25': true, '50': false, '75': false, '100': false},
    ),
  ];

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelect = false;

  void nextQuestion() {
    if (index == _questions.length - 1) {
      showDialog(
          context: context,
          barrierDismissible:
              false, //this will disable the dissmis function on clicking outside of box
          builder: (ctx) => ResultBox(
                result: score,
                questionLength: _questions.length,
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++; //when the index will change to 1. rebuild the app.
          isPressed = false;
          isAlreadySelect = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('กรุณาเลือกคำตอบก่อนกดต่อไป'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelect) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelect = true;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelect = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child:
                Text('Score: $score', style: const TextStyle(fontSize: 18.0)),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidget(
              indexAction: index,
              question: _questions[index].title,
              totalQuestion: _questions.length,
            ),
            const Divider(
              color: fontcolor,
            ),
            //add space
            const SizedBox(
              height: 25.0,
            ),
            for (int i = 0; i < _questions[index].options.length; i++)
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(
                    _questions[index].options.values.toList()[i]),
                child: OptionCard(
                  option: _questions[index].options.keys.toList()[i],
                  color: isPressed
                      ? _questions[index].options.values.toList()[i] == true
                          ? correct
                          : incorrect
                      : fontcolor,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
