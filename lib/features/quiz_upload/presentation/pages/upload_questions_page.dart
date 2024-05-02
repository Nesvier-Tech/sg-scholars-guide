// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/state_management/quiz_input_page/quiz_input_page_bloc.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_page_widgets/add_or_submit_display.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_page_widgets/change_subject_display.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_page_widgets/latex_sample_display.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_widgets/question_input_display.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/features/quiz_upload/presentation/widgets/quiz_input_widgets/question_preview_display.dart';

class UploadQuestionPage extends StatefulWidget {
  const UploadQuestionPage({super.key});

  @override
  State<UploadQuestionPage> createState() => _UploadQuestionPageState();
}

class _UploadQuestionPageState extends State<UploadQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: BlocProvider(
        create: (blocContext) => QuizInputPageBloc(),
        child: BlocBuilder<QuizInputPageBloc, QuizInputPageState>(
          builder: (blocBuilderContext, state) {
            if (state is QuizInputPageQuestionsAdd) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Color.fromRGBO(207, 0, 15, 1),
                  title: const Text('Upload Questions',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  bottom: PreferredSize(
                      preferredSize: Size.fromHeight(60.0),
                      child: Column(
                        children: [
                          Container(
                            width: 350,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            child: TabBar(
                              indicatorColor: Color.fromRGBO(207, 0, 15, 1),
                              labelColor: Color.fromRGBO(207, 0, 15, 1),
                              unselectedLabelColor: Colors.white,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: Colors.white,
                              ),
                              tabs: const <Widget>[
                                Tab(
                                  icon: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.edit_outlined),
                                      SizedBox(width: 8.0),
                                      Text('Edit'),
                                    ],
                                  ),
                                ),
                                Tab(
                                  icon: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.preview_outlined),
                                      SizedBox(width: 8.0),
                                      Text('Preview'),
                                    ],
                                  ),
                                ),
                                Tab(
                                  icon: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.menu_book_outlined),
                                      SizedBox(width: 8.0),
                                      Text('Latex'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                        ],
                      )),
                ),
                body: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(207, 0, 15, 1),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              ChangeSubjectDisplay(),
                              Text(
                                "* Quiz Upload supports Latex. Check Latex tab for a sample. Swipe left to delete a question.",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                              QuestionInputDisplay(),
                              AddOrSubmitDisplay(),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: QuestionPreviewDisplay(),
                        ),
                        SingleChildScrollView(
                          child: LatexSampleDisplay(),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Text("Something went wrong! (state not found)");
          },
        ),
      ),
    );
  }
}
