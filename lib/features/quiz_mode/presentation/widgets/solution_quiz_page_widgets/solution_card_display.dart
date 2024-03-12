// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';
import 'package:markdown/markdown.dart' as md;

class SolutionCardDisplay extends StatefulWidget {
  const SolutionCardDisplay(
      {super.key,
      required this.question,
      required this.answer,
      required this.solution});

  final String question;
  final String answer;
  final String solution;

  @override
  State<SolutionCardDisplay> createState() => _SolutionCardDisplayState();
}

class _SolutionCardDisplayState extends State<SolutionCardDisplay> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextTitle(title: "Question"),
              TextMarkdown(
                text: widget.question,
                styleSheet: MarkdownStyleSheet(
                  textAlign: WrapAlignment.center,
                  p: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              TextTitle(title: "Answer"),
              TextMarkdown(
                text: widget.answer,
                styleSheet: MarkdownStyleSheet(
                  textAlign: WrapAlignment.center,
                  p: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              TextTitle(title: "Solution"),
              TextMarkdown(
                text: widget.solution == ""
                    ? "No solution yet provided"
                    : widget.solution,
                styleSheet: MarkdownStyleSheet(
                  textAlign: WrapAlignment.center,
                  p: const TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Text(title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 95, 55, 213),
          )),
    );
  }
}

class TextMarkdown extends StatelessWidget {
  const TextMarkdown({
    super.key,
    required this.text,
    required this.styleSheet,
  });

  final String text;
  final MarkdownStyleSheet styleSheet;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Markdown(
        padding: EdgeInsets.all(0.0),
        shrinkWrap: true,
        data: text,
        builders: {
          'latex': LatexElementBuilder(),
        },
        styleSheet: styleSheet,
        extensionSet: md.ExtensionSet(
          [LatexBlockSyntax()],
          [LatexInlineSyntax()],
        ),
      ),
    );
  }
}
