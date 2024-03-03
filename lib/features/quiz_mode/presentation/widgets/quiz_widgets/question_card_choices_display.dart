// ignore_for_file: prefer_const_constructors

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

          return Column(children: buttons);
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
    color = isCorrect
        ? isChosen
            ? Colors.green
            : Colors.black
        : isChosen
            ? Colors.red
            : Colors.black;
  } else if (isChosen) {
    color = Colors.indigoAccent;
  }
  return ElevatedButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: color),
        ),
      ),
    ),
    onPressed: isRevealed ? null : func,
    child: TextMarkdown(text: choice),
  );
}

class TextMarkdown extends StatelessWidget {
  const TextMarkdown({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Markdown(
      padding: EdgeInsets.all(0.0),
      shrinkWrap: true,
      data: text,
      builders: {
        'latex': LatexElementBuilder(),
      },
      styleSheet: MarkdownStyleSheet(
        textAlign: WrapAlignment.center,
        p: const TextStyle(fontSize: 15.0),
      ),
      extensionSet: md.ExtensionSet(
        [LatexBlockSyntax()],
        [LatexInlineSyntax()],
      ),
    );
  }
}
