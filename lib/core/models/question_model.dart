// ignore_for_file: avoid_print, constant_identifier_names, non_constant_identifier_names

import 'dart:math';

import 'package:scholars_guide/core/models/firestore_model.dart';

enum SUBJ { MATH, SCIENCE, READING, LANGUAGE, ALL }

class Question {
  final String question;
  final List<String> options;
  final int correctIndex;
  final SUBJ subject;

  const Question({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.subject,
  });

  void printQuestion() {
    print('Question: $question');
    print('Options: $options');
    print('Correct: $correctIndex');
  }

  // Returns a Question Class using data fetched from the Firestore
  factory Question.fromMap(Map<String, dynamic> data, SUBJ subject) {
    List<String> temp = [];
    for (var val in data[FireStore.options].values) {
      temp.add(val);
    }
    
    String temp2 = temp[int.parse(data[FireStore.correctIndex])]; 
    temp.shuffle(Random());

    return Question(
        subject: subject,
        question: data[FireStore.question],
        options: temp,
        correctIndex: temp.indexWhere((element) => element == temp2));
  }

  // Converts the Question Class to a json like file to be stored in the Firestore
  Map<String, dynamic> toMap() {
    return {
      FireStore.question: question,
      FireStore.options: {
        '0': options[0],
        '1': options[1],
        '2': options[2],
        '3': options[3],
      },
      FireStore.correctIndex: correctIndex.toString(),
    };
  }

  static String SUBJ2string(SUBJ subj) {
    switch (subj) {
      case SUBJ.MATH:
        return "Math";
      case SUBJ.SCIENCE:
        return "Science";
      case SUBJ.READING:
        return "Reading Comprehension";
      case SUBJ.LANGUAGE:
        return "Language Proficiency";
      case SUBJ.ALL:
        return 'all subjects';
    }
  }

  static SUBJ string2SUBJ(String subj) {
    switch (subj) {
      case "Math":
        return SUBJ.MATH;
      case "Science":
        return SUBJ.SCIENCE;
      case "Reading Comprehension":
        return SUBJ.READING;
      case "Language Proficiency":
        return SUBJ.LANGUAGE;
    }
    return SUBJ.ALL;
  }
}
