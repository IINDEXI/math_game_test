import 'package:flutter/material.dart';
import '../default/default.dart';
import '../componant/question.dart';
import '../componant/question_widget.dart';
import '../componant/next_button.dart';
import '../componant/option_card.dart';
import '../componant/result_box.dart';

class AddandSubtract extends StatefulWidget {
  const AddandSubtract({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddandSubtractState createState() => _AddandSubtractState();
}

class _AddandSubtractState extends State<AddandSubtract> {
  final List<Question> _questions = [
    Question(
      id: '10',
      title: '2 + 2 เท่ากับเท่าไร?',
      options: {'5': false, '30': false, '4': true, '10': false},
    ),
    Question(
      id: '10',
      title: '10 + 20 เท่ากับเท่าไร?',
      options: {'50': false, '30': true, '40': false, '10': false},
    ),
    Question(
      id: '10',
      title: '22 + 22 เท่ากับเท่าไร?',
      options: {'44': true, '30': false, '45': false, '50': false},
    ),
    Question(
      id: '10',
      title: '50 - 20 เท่ากับเท่าไร?',
      options: {'20': false, '30': true, '80': false, '10': false},
    ),
    Question(
      id: '10',
      title: '25 + 2 เท่ากับเท่าไร?',
      options: {'23': false, '27': true, '42': false, '72': false},
    ),
    Question(
      id: '10',
      title: '100 + 20 เท่ากับเท่าไร?',
      options: {'50': false, '30': false, '40': false, '120': true},
    ),
    Question(
      id: '10',
      title: '225 + 25 เท่ากับเท่าไร?',
      options: {'250': true, '300': false, '325': false, '275': false},
    ),
    Question(
      id: '10',
      title: '150 + 200 เท่ากับเท่าไร?',
      options: {'500': false, '350': true, '400': false, '100': false},
    ),Question(
      id: '10',
      title: '200 - 20 เท่ากับเท่าไร?',
      options: {'180': true, '300': false, '258': false, '150': false},
    ),
    Question(
      id: '10',
      title: '350 - 200 เท่ากับเท่าไร?',
      options: {'150': true, '300': false, '400': false, '100': false},
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
        title: const Text('เกมทดสอบคณิตศาสตร์'),
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
