// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

// Holds multiple question answer cards
class QuestionDisplay extends StatefulWidget {
  const QuestionDisplay({super.key});

  @override
  State<QuestionDisplay> createState() => _QuestionDisplayState();
}

class _QuestionDisplayState extends State<QuestionDisplay> {
  List<QuestionAnswerCard> questionAnswerCards = [
    QuestionAnswerCard(),
    QuestionAnswerCard(),
    QuestionAnswerCard()
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView(children: [...questionAnswerCards]));
  }
}

// The question answer card
class QuestionAnswerCard extends StatefulWidget {
  const QuestionAnswerCard({super.key});

  @override
  State<QuestionAnswerCard> createState() => _QuestionAnswerCardState();
}

class _QuestionAnswerCardState extends State<QuestionAnswerCard> {
  List<String> choices = ["11111", "2222", "3333", "41114141"];
  String correctAnswer = "11111";
  String question = "Question";

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(7.0),
        ),
        alignment: Alignment.center,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Align(
                    alignment: Alignment.center,
                    child: Container(margin:EdgeInsets.only(left:25.0, right:25.0), child: Text(question, style: TextStyle(fontSize: 17.0))))),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: choiceButton("A. ${choices[0]}"),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: choiceButton("B. ${choices[1]}"),
                    )
                  ]),
                  Column(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: choiceButton("C. ${choices[2]}"),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: choiceButton("D. ${choices[3]}"),
                    ),
                  ])
                ],
              ),
            ),
          ],
        ));
  }
}

// Expanded(child: choiceButton("A. ${choices[0]}")),
// Expanded(child: choiceButton("B. ${choices[1]}")),
OutlinedButton choiceButton(String choice) {
  return OutlinedButton(
    onPressed: () {},
    child: Text(choice, style: TextStyle(fontSize: 15.0)),
  );
}
