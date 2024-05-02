// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz_card/quiz_card_cubit.dart';
import 'package:markdown/markdown.dart' as md;

class QuestionCardChoicesDisplay extends StatefulWidget {
  const QuestionCardChoicesDisplay({super.key, required this.bloc});

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
          List<ChoiceButton> buttons = [];

          for (int i = 0; i < choices.length; i++) {
            String c = choices[i];

            ChoiceButton button;
            if (state is QuizCardUnanswered) {
              button = ChoiceButton(
                letter: String.fromCharCode(i + 'A'.codeUnitAt(0)),
                choice: c,
                func: () {
                  widget.bloc.chooseOption(index: i);
                },
              );
            } else if (state is QuizCardAnswered) {
              button = ChoiceButton(
                letter: String.fromCharCode(i + 'A'.codeUnitAt(0)),
                choice: c,
                func: () {
                  widget.bloc.chooseOption(index: i);
                },
                isChosen: state.chosenIndex == i,
                isCorrect: widget.bloc.correctIndex == state.chosenIndex,
              );
            } else if (state is QuizCardRevealed) {
              button = ChoiceButton(
                letter: String.fromCharCode(i + 'A'.codeUnitAt(0)),
                choice: c,
                func: () {},
                isChosen: state.chosenIndex == i,
                isCorrect: widget.bloc.correctIndex == state.chosenIndex,
                isRevealed: true,
              );
            } else {
              button = ChoiceButton(
                letter: String.fromCharCode(i + 'A'.codeUnitAt(0)),
                choice: c,
                func: () {},
              );
            }
            buttons.add(button);
          }

          return Column(children: buttons);
        });
  }
}

class ChoiceButton extends StatelessWidget {
  ChoiceButton({
    super.key,
    required this.letter,
    required this.choice,
    required this.func,
    this.isChosen = false,
    this.isCorrect = false,
    this.isRevealed = false,
  });

  bool isChosen;
  bool isCorrect;
  bool isRevealed;
  final String letter;
  final String choice;
  final func;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.black;
    if (isRevealed) {
      color = isCorrect
          ? isChosen
              ? Colors.green
              : Colors.white
          : isChosen
              ? Color.fromRGBO(207, 0, 15, 1)
              : Colors.white;
    } else if (isChosen) {
      color = Color.fromRGBO(207, 0, 15, 1);
    }

    return Container(
      constraints: BoxConstraints(
        minHeight: 20.0,
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      margin: EdgeInsets.only(top: 2.0, bottom: 2.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(isRevealed
              ? color
              : isChosen
                  ? const Color.fromRGBO(207, 0, 15, 1)
                  : Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(
                color: isRevealed && isChosen && isCorrect
                    ? Colors.green
                    : const Color.fromRGBO(207, 0, 15, 1),
              ),
            ),
          ),
        ),
        onPressed: isRevealed ? null : func,
        child: TextMarkdown(text: "$letter. $choice", isChosen: isChosen),
      ),
    );
  }
}

class TextMarkdown extends StatelessWidget {
  const TextMarkdown({
    super.key,
    required this.text,
    required this.isChosen,
  });

  final String text;
  final bool isChosen;

  @override
  Widget build(BuildContext context) {
    return Markdown(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(0.0),
      shrinkWrap: true,
      data: text,
      builders: {
        'latex': LatexElementBuilder(
          textScaleFactor: 1.3,
          textStyle: TextStyle(
            fontSize: 15.0,
            color: isChosen ? Colors.white : Color.fromRGBO(207, 0, 15, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
      },
      styleSheet: MarkdownStyleSheet(
        textAlign: WrapAlignment.center,
        p: TextStyle(
          fontSize: 15.0,
          color: isChosen ? Colors.white : Color.fromRGBO(207, 0, 15, 1),
          fontWeight: FontWeight.bold,
        ),
      ),
      extensionSet: md.ExtensionSet(
        [LatexBlockSyntax()],
        [LatexInlineSyntax()],
      ),
    );
  }
}
