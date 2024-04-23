// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scholars_guide/core/models/question_model.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz_card/quiz_card_cubit.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/solution_quiz/solution_quiz_cubit.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_page_widgets/question_loading_display.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/solution_quiz_page_widgets/solution_card_display.dart';

class SolutionsQuizPage extends StatefulWidget {
  const SolutionsQuizPage({super.key});

  @override
  State<SolutionsQuizPage> createState() => _SolutionsQuizPageState();
}

class _SolutionsQuizPageState extends State<SolutionsQuizPage> {
  @override
  Widget build(BuildContext context) {
    final extraMap = GoRouterState.of(context).extra as Map<String, dynamic>;
    final SUBJ subject = extraMap['subject'] as SUBJ;
    final Map<SUBJ, List<QuizCardCubit>> subjectQuestionsMap =
        extraMap['subjectQuestionsMap'] as Map<SUBJ, List<QuizCardCubit>>;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Solutions Page',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: BlocProvider(
        create: (providerContext) => SolutionQuizCubit()..loadSolutions(),
        child: BlocBuilder<SolutionQuizCubit, SolutionQuizState>(
          builder: (solutionQuizCubitContext, state) {
            List<QuizCardCubit> questions = subjectQuestionsMap[subject]!;

            if (state is SolutionQuizLoad) {
              return QuestionLoadingDisplay();
            } else if (state is SolutionQuizShown) {
              return PageView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) => SolutionCardDisplay(
                  question: questions[index].question,
                  answer: questions[index]
                      .optionsArray[questions[index].correctIndex],
                  solution: questions[index].solution,
                  commentRef: questions[index].commentRef,
                ),
              );
            }
            return Center(
              child: Text('Something went wrong'),
            );
          },
        ),
      ),
    );
  }
}
