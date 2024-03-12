// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input/quiz_input_cubit.dart';
import 'package:markdown/markdown.dart' as md;

class QuestionPreviewCardDisplay extends StatelessWidget {
  const QuestionPreviewCardDisplay({super.key, required this.questionCubit});

  final QuizInputCubit questionCubit;

  @override
  Widget build(BuildContext context) {
    int correctIndex = int.parse(questionCubit.answerIndex);

    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          // Question
          TextContainer(text: questionCubit.question),

          // Choices
          OptionContainer(
              text: "A: ${questionCubit.options[0]}",
              isCorrect: 0 == correctIndex),
          OptionContainer(
              text: "B: ${questionCubit.options[1]}",
              isCorrect: 1 == correctIndex),
          OptionContainer(
              text: "C: ${questionCubit.options[2]}",
              isCorrect: 2 == correctIndex),
          OptionContainer(
              text: "D: ${questionCubit.options[3]}",
              isCorrect: 3 == correctIndex),

          // Solution
          TextContainer(text: questionCubit.solution),
        ],
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  const TextContainer({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromARGB(255, 178, 178, 178),
          ),
          borderRadius: BorderRadius.circular(10.0)),
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.2,
      ),
      margin: EdgeInsets.all(8.0),
      child: TextMarkdown(text: text),
    );
  }
}

class OptionContainer extends StatelessWidget {
  const OptionContainer({
    super.key,
    required this.text,
    required this.isCorrect,
  });

  final String text;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color:
                isCorrect ? Colors.green : Color.fromARGB(255, 178, 178, 178),
          ),
          borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.all(2.0),
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.02,
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextMarkdown(text: text),
    );
  }
}

class TextMarkdown extends StatelessWidget {
  const TextMarkdown({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Markdown(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        data: text,
        builders: {
          'latex': LatexElementBuilder(),
        },
        extensionSet: md.ExtensionSet(
          [LatexBlockSyntax()],
          [LatexInlineSyntax()],
        ),
      ),
    );
  }
}
