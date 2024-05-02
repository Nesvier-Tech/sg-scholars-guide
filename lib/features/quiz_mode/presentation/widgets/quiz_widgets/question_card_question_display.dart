// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';
import 'package:markdown/markdown.dart' as md;

class QuestionCardQuestionDisplay extends StatelessWidget {
  const QuestionCardQuestionDisplay({super.key, required this.question});

  final String question;

  @override
  Widget build(BuildContext context) {
    return TextMarkdown(text: question);
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
    return Markdown(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      data: text,
      builders: {
        'latex': LatexElementBuilder(
          textScaleFactor: 1.2,
          textStyle: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      },
      styleSheet: MarkdownStyleSheet(
        textAlign: WrapAlignment.center,
        p: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
      ),
      extensionSet: md.ExtensionSet(
        [LatexBlockSyntax()],
        [LatexInlineSyntax()],
      ),
    );
  }
}
