// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// Holds multiple question input cards
class QuestionInputDisplay extends StatefulWidget {
  const QuestionInputDisplay({super.key});

  @override
  State<QuestionInputDisplay> createState() => _QuestionInputDisplayState();
}

class _QuestionInputDisplayState extends State<QuestionInputDisplay> {
  List<QuestionInputCard> questionInputCards = [
    QuestionInputCard(),
    QuestionInputCard()
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: questionInputCards.length,
        itemBuilder: (context, index) {
          return 
          Dismissible(
              background: Container(
                width: 50.0,
                height: 50.0,
                color: Colors.red,
                child: Icon(Icons.delete),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20.0),
                margin: EdgeInsets.only(bottom: 10.0),
              ),
              direction: DismissDirection.endToStart,
              key: ValueKey<int>(index),
              child: questionInputCards[index]);
        },
      ),
    );
  }
}

// The question input card
class QuestionInputCard extends StatefulWidget {
  const QuestionInputCard({super.key});

  @override
  State<QuestionInputCard> createState() => _QuestionInputCardState();
}

class _QuestionInputCardState extends State<QuestionInputCard> {
  List<QuestionInputOptions> questionInputOptions = [
    QuestionInputOptions(),
    QuestionInputOptions(),
    QuestionInputOptions(),
    QuestionInputOptions(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      height: 430,
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.deepOrange[100],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                height: 200,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  maxLines: null,
                  expands: true,
                ),
              ),
              ...questionInputOptions,
            ],
          )),
    );
  }
}

class QuestionInputOptions extends StatefulWidget {
  const QuestionInputOptions({super.key});

  @override
  State<QuestionInputOptions> createState() => _QuestionInputOptionsState();
}

class _QuestionInputOptionsState extends State<QuestionInputOptions> {
  // Might need question id to link the options to the question
  bool correctAnswer = true;
  String optionValue = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2.0),
        margin: EdgeInsets.only(left: 30.0),
        width: MediaQuery.of(context).size.width * 0.70,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            IconButton(
              icon: Icon(correctAnswer
                  ? Icons.check_circle
                  : Icons.check_circle_outline_rounded),
              color: correctAnswer ? Colors.green : Colors.red,
              onPressed: () {
                setState(() {
                  correctAnswer = !correctAnswer;
                });
                // Then change other options to false
              },
            ),
          ],
        ));
  }
}
