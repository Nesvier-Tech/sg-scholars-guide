// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class QuestionAnswerCard extends StatefulWidget {
  const QuestionAnswerCard(
      {super.key,
      required this.choices,
      required this.correctChoiceKey,
      required this.question});

  final List<String> choices;
  final String correctChoiceKey;
  final String question;

  @override
  State<QuestionAnswerCard> createState() => _QuestionAnswerCardState();
}

class _QuestionAnswerCardState extends State<QuestionAnswerCard> {
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
                    child: Container(
                        margin: EdgeInsets.only(left: 25.0, right: 25.0),
                        child:
                            Text(widget.question, style: TextStyle(fontSize: 17.0))))),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: _choiceButton("A. ${widget.choices[0]}"),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: _choiceButton("B. ${widget.choices[1]}"),
                    )
                  ]),
                  Column(children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: _choiceButton("C. ${widget.choices[2]}"),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: _choiceButton("D. ${widget.choices[3]}"),
                    ),
                  ])
                ],
              ),
            ),
          ],
        ));
  }
}

OutlinedButton _choiceButton(String choice) {
  return OutlinedButton(
    onPressed: () {},
    child: Text(choice, style: TextStyle(fontSize: 15.0)),
  );
}
