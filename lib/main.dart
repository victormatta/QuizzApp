import 'package:flutter/material.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Center(
            child: Text('QuizApp', style: TextStyle(color: Colors.white),),
          ),
        ),
        body: const QuizAppBody(),
      ),
    );
  }
}

class QuizAppBody extends StatefulWidget {
  const QuizAppBody({super.key});

  @override
  State<QuizAppBody> createState() => _QuizAppBodyState();
}

class _QuizAppBodyState extends State<QuizAppBody> {
  List<Icon> markList = [];

  List<String> askList = [
    "Ratatouile is a Disney movie.",
    "Corinthians is a Brazilian Team.",
    "Nike and Adidas have same symbol.",
    "Strogonoff is a Russian food.",
  ];

  List<bool> correctAnswers = [true, true, false, true];

  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Column(
          children: [
            Center(
              child: Text(askList[currentQuestionIndex],
                style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  height: 50,
                  margin: const EdgeInsets.only(bottom: 25),
                  child: Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _checkAnswer(true);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        )),
                      ),
                      child: const Text('Verdadeiro', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  height: 50,
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _checkAnswer(false);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black54),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        )),
                      ),
                      child: const Text('Falso', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: markList,
            ),
          ],
        ),
      ],
    );
  }

  void _checkAnswer(bool userAnswer) {
    bool isCorrect = userAnswer == correctAnswers[currentQuestionIndex];

    setState(() {
      markList.add(isCorrect ? const Icon(Icons.check) : const Icon(Icons.close));
      currentQuestionIndex++;
    });
  }
}