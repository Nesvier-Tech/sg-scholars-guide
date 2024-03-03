// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz_card/quiz_card_cubit.dart';

class QuestionCardChoicesDisplay extends StatefulWidget {
  const QuestionCardChoicesDisplay(
      {super.key, required this.bloc});

  final QuizCardCubit bloc;

  @override
  State<QuestionCardChoicesDisplay> createState() =>
      _QuestionCardChoicesDisplayState();
}

class _QuestionCardChoicesDisplayState
    extends State<QuestionCardChoicesDisplay> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCardCubit, QuizCardState>(
        bloc: widget.bloc,
        builder: (choicesContext, state) {
          List<String> choices = widget.bloc.optionsArray;
          List<ElevatedButton> buttons = [];

          for (int i = 0; i < choices.length; i++) {
            String c = choices[i];

            ElevatedButton button;
            if (state is QuizCardUnanswered) {
              button = _createChoiceButton(
                  choice: c,
                  func: () {
                    widget.bloc.chooseOption(index: i);
                  },
                  context: context);
            } else if (state is QuizCardAnswered) {
              button = _createChoiceButton(
                  choice: c,
                  func: () {
                    widget.bloc.chooseOption(index: i);
                  },
                  isChosen: state.chosenIndex == i,
                  isCorrect: widget.bloc.correctIndex == state.chosenIndex,
                  context:
                      context); // ! This is the line that needs to be changed
            } else if (state is QuizCardRevealed) {
              button = _createChoiceButton(
                  choice: c,
                  func: () {},
                  isChosen: state.chosenIndex == i,
                  isCorrect: widget.bloc.correctIndex == state.chosenIndex,
                  isRevealed: true,
                  context: context);
            } else {
              button =
                  _createChoiceButton(choice: c, func: () {}, context: context);
            }
            buttons.add(button);
          }

          return Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: buttons.sublist(0, 2)),
                Column(children: buttons.sublist(2))
              ],
            ),
          );
        });
  }
}

ElevatedButton _createChoiceButton(
    {required String choice,
    bool isChosen = false,
    bool isCorrect = false,
    bool isRevealed = false,
    required func,
    required context}) {
  Color color = Colors.black;
  if (isRevealed) {
    color = isCorrect ? isChosen? Colors.green: Colors.black : isChosen ? Colors.red : Colors.black;
  } else if (isChosen) {
    color = Colors.blue;
  }
  return ElevatedButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
              side: BorderSide(color: color))),
      minimumSize: MaterialStateProperty.all<Size>(
          Size(MediaQuery.of(context).size.width * 0.4, 40.0)),
    ),
    onPressed: isRevealed ? null : func,
    child: Text(choice, style: TextStyle(fontSize: 15.0)),
  );
}
