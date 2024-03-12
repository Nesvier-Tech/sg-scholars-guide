// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input/quiz_input_cubit.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input_page/quiz_input_page_bloc.dart';

// The question input card
class QuestionInputCard extends StatefulWidget {
  const QuestionInputCard({super.key, required this.questionCubit});

  final QuizInputCubit questionCubit;

  @override
  State<QuestionInputCard> createState() => _QuestionInputCardState();
}

class _QuestionInputCardState extends State<QuestionInputCard> {
  @override
  Widget build(BuildContext context) {
    QuizInputPageBloc quizInputPageBloc = context.read<QuizInputPageBloc>();

    QuizInputCubit questionCubit = widget.questionCubit;

    TextEditingController questionController =
        TextEditingController(text: questionCubit.question);

    TextEditingController solutionController =
        TextEditingController(text: questionCubit.solution);

    return Card(
      child: FormBuilder(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              height: 200,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    borderSide: BorderSide(
                        color: quizInputPageBloc.revealBlanks
                            ? questionCubit.questionNonEmpty
                                ? Color.fromARGB(255, 178, 178, 178)
                                : Colors.red
                            : Color.fromARGB(255, 178, 178, 178),
                        width: 1),
                  ),
                  hintText: "Enter the question here",
                  filled: true,
                  fillColor: Colors.white,
                ),
                maxLines: null,
                expands: true,
                controller: questionController,
                keyboardType: TextInputType.multiline,
                onChanged: (questionInput) {
                  questionCubit.question = questionInput;
                  questionCubit.questionNonEmpty = questionInput.isNotEmpty;
                },
              ),
            ),
            QuestionInputOptions(
              questionCubit: questionCubit,
              optionIndex: 0,
              revealBlank: quizInputPageBloc.revealBlanks &&
                  !questionCubit.optionsNonEmpty[0],
            ),
            QuestionInputOptions(
                questionCubit: questionCubit,
                optionIndex: 1,
                revealBlank: quizInputPageBloc.revealBlanks &&
                    !questionCubit.optionsNonEmpty[1]),
            QuestionInputOptions(
                questionCubit: questionCubit,
                optionIndex: 2,
                revealBlank: quizInputPageBloc.revealBlanks &&
                    !questionCubit.optionsNonEmpty[2]),
            QuestionInputOptions(
                questionCubit: questionCubit,
                optionIndex: 3,
                revealBlank: quizInputPageBloc.revealBlanks &&
                    !questionCubit.optionsNonEmpty[3]),
            Container(
              padding: EdgeInsets.all(8.0),
              height: 200,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    borderSide: BorderSide(
                        color: quizInputPageBloc.revealBlanks
                            ? questionCubit.solutionNonEmpty
                                ? Color.fromARGB(255, 178, 178, 178)
                                : Colors.red
                            : Color.fromARGB(255, 178, 178, 178),
                        width: 1),
                  ),
                  hintText: "Enter the solution here",
                  filled: true,
                  fillColor: Colors.white,
                ),
                maxLines: null,
                expands: true,
                controller: solutionController,
                onChanged: (solutionInput) {
                  questionCubit.solution = solutionInput;
                  questionCubit.solutionNonEmpty = solutionInput.isNotEmpty;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionInputOptions extends StatefulWidget {
  const QuestionInputOptions(
      {super.key,
      required this.optionIndex,
      required this.questionCubit,
      required this.revealBlank});

  final QuizInputCubit questionCubit;
  final int optionIndex;
  final bool revealBlank;

  @override
  State<QuestionInputOptions> createState() => _QuestionInputOptionsState();
}

class _QuestionInputOptionsState extends State<QuestionInputOptions> {
  @override
  Widget build(BuildContext context) {
    QuizInputCubit questionCubit = widget.questionCubit;
    int optionIndex = widget.optionIndex;
    bool revealBlank = widget.revealBlank;

    TextEditingController optionController =
        TextEditingController(text: questionCubit.options[optionIndex]);

    return Container(
      padding: EdgeInsets.all(2.0),
      margin: EdgeInsets.only(left: 30.0),
      width: MediaQuery.of(context).size.width * 0.90,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0),
                  borderSide: BorderSide(
                      color: revealBlank
                          ? Colors.red
                          : Color.fromARGB(255, 178, 178, 178),
                      width: 1),
                ),
                hintText: "Enter one of the options here",
                filled: true,
                fillColor: Colors.white,
              ),
              controller: optionController,
              onChanged: (optionInput) {
                List<String> options = List.from(questionCubit.options);
                options[optionIndex] = optionInput;

                List<bool> optionsNonEmpty =
                    List.from(questionCubit.optionsNonEmpty);
                optionsNonEmpty[optionIndex] = optionInput.isNotEmpty;

                questionCubit.options = options;
                questionCubit.optionsNonEmpty = optionsNonEmpty;
              },
            ),
          ),
          BlocBuilder<QuizInputCubit, QuizInputState>(
            bloc: questionCubit,
            builder: (context, state) {
              return IconButton(
                icon: Icon(Icons.check_circle_outline_rounded),
                color: optionIndex.toString() == questionCubit.answerIndex
                    ? Colors.green
                    : Color.fromARGB(255, 108, 108, 108),
                onPressed: () {
                  questionCubit.refresh();
                  questionCubit.answerIndex = optionIndex.toString();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
