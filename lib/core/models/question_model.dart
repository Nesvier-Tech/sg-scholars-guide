// ignore_for_file: avoid_print, constant_identifier_names, non_constant_identifier_names

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scholars_guide/core/models/firestore_model.dart';

enum SUBJ { MATH, SCIENCE, READING, LANGUAGE, ALL }

class Question {
  Question({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.subject,
    this.id = '',
    this.solution = '',
    this.solutionRef,
    this.commentRef,
    this.createdBy,
    this.questionRef,
  });

  final String question;
  final List<String> options;
  final int correctIndex;
  final SUBJ subject;
  String id;
  String solution;
  DocumentReference? solutionRef;
  DocumentReference? commentRef;
  DocumentReference? questionRef;

  DocumentReference? createdBy;
  final Timestamp createdAt = Timestamp.now();

  static var updatedAt = FieldValue.serverTimestamp();
  static const String updatedBy = ''; // ! This is a placeholder

  static bool isVerified = false;
  static const String verifiedAt = '';
  static const String verifiedBy = '';

  void printQuestion() {
    print('Question: $question');
    print('Options: $options');
    print('Correct: $correctIndex');
  }

  // Returns a Question Class using data fetched from the Firestore
  factory Question.fromMap({
    required String id,
    required Map<String, dynamic> data,
    required SUBJ subject,
    DocumentReference? questionRef,
  }) {
    List<String> temp = [];
    for (var val in data[FireStore.options].values) {
      temp.add(val);
    }
    String temp2 = temp[int.parse(data[FireStore.correctIndex])];
    temp.shuffle(Random());
    // print('Question: ${data[FireStore.question]}');
    // print('Reference: $questionRef');

    return Question(
        id: id,
        subject: subject,
        question: data[FireStore.question],
        solutionRef: data[FireStore.solutionRef],
        commentRef: data[FireStore.commentRef],
        options: temp,
        correctIndex: temp.indexWhere((element) => element == temp2),
        createdBy: data[FireStore.createdBy],
        questionRef: questionRef);
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
      FireStore.solutionRef: solutionRef,
      FireStore.commentRef: commentRef,
      FireStore.createdBy: createdBy,
      FireStore.createdAt: createdAt,
    };
  }

  static String SUBJ2string(SUBJ subj) {
    switch (subj) {
      case SUBJ.MATH:
        return "Mathematics";
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
      case "Mathematics":
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
