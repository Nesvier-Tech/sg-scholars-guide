// ignore_for_file: avoid_print, constant_identifier_names, non_constant_identifier_names

import 'package:scholars_guide/core/models/firestore_model.dart';

enum SUBJ { MATH, SCIENCE, READING, LANGUAGE, ALL }

class Question {
  final String question;
  final List<String> options;
  final String correct;
  final String questionID;
  final String ownerID;

  const Question(
      {required this.question,
      required this.options,
      required this.correct,
      required this.questionID,
      required this.ownerID});

  void printQuestion() {
    print('Question: $question');
    print('Options: $options');
    print('Correct: $correct');
    print('Question ID: $questionID');
    print('Owner ID: $ownerID');
  }

  // Returns a Question Class using data fetched from the Firestore
  factory Question.fromMap(Map<String, dynamic> data) {
    return Question(
        question: data[FireStore.question],
        options: List<String>.from(data[FireStore.options]),
        correct: data[FireStore.correctIndex],
        questionID: data[FireStore.questionID],
        ownerID: data[FireStore.ownerID]);
  }

  // Converts the Question Class to a json like file to be stored in the Firestore
  Map<String, dynamic> toMap() {
    return {
      FireStore.question: question,
      FireStore.options: options,
      FireStore.correctIndex: correct,
      FireStore.questionID: questionID,
      FireStore.ownerID: ownerID
    };
  }

  static String SUBJ2subject(SUBJ subj) {
    switch (subj) {
      case SUBJ.MATH:
        return FireStore.subjects[0];
      case SUBJ.SCIENCE:
        return FireStore.subjects[1];
      case SUBJ.READING:
        return FireStore.subjects[2];
      case SUBJ.LANGUAGE:
        return FireStore.subjects[3];
      case SUBJ.ALL:
        return 'all-subjects';
    }
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
}
