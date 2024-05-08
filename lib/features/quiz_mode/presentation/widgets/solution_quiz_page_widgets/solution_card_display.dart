// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:scholars_guide/features/quiz_mode/data/repositories/quiz_mode_repository_impl.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_page_widgets/question_loading_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/solution_quiz_page_widgets/solution_comment_modal.dart';

class SolutionCardDisplay extends StatefulWidget {
  const SolutionCardDisplay(
      {super.key,
      required this.question,
      required this.answer,
      required this.solution,
      required this.commentRef});

  final String question;
  final String answer;
  final String solution;
  final DocumentReference commentRef;

  @override
  State<SolutionCardDisplay> createState() => _SolutionCardDisplayState();
}

class _SolutionCardDisplayState extends State<SolutionCardDisplay> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    color: const Color.fromRGBO(128, 0, 0, 1),
                    size: 12,
                  ),
                  Text(
                    "  Swipe",
                    style: TextStyle(
                        fontSize: 11,
                        color: const Color.fromRGBO(128, 0, 0, 1)),
                  ),
                ],
              ),
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
              Expanded(
                child: TextMarkdown(
                  text: widget.solution == ""
                      ? "No solution yet provided"
                      : widget.solution,
                  styleSheet: MarkdownStyleSheet(
                    textAlign: WrapAlignment.center,
                    p: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Container(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      builder: (BuildContext context) => FutureBuilder(
                        future: QuizModeRepositoryImpl()
                            .collectComments(docRef: widget.commentRef),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return QuestionLoadingDisplay();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return SolutionCommentModal(
                              docRef: widget.commentRef,
                              comments: snapshot.data,
                            );
                          }
                        },
                      ),
                    );
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(128, 0, 0, 1)),
                  ),
                  child: Text("Comments",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17,
                      )),
                ),
              ),
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
            color: const Color.fromRGBO(128, 0, 0, 1),
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
