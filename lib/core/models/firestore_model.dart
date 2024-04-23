// ignore_for_file: non_constant_identifier_names

import 'package:scholars_guide/core/models/question_model.dart';

class FireStore {
  //* Collection names in the Firestore
  static const usersCollection = 'users';
  static const solutionsCollection = 'solutions';
  static const commentsCollection = 'comments';
  static const additionalQuestionDataRef = 'additionalQuestionsData';
  static const subjects = {
    SUBJ.MATH: 'mathematicsQuestions',
    SUBJ.SCIENCE: 'scienceQuestions',
    SUBJ.READING: 'readingComprehensionQuestions',
    SUBJ.LANGUAGE: 'languageProficiencyQuestions',
    SUBJ.ALL: 'all-subjects'
  };

  //* Field names of each document in the Firestore
  // Question related fields
  static const String question = 'question';
  static const String options = 'choices';
  static const String correctIndex = 'correctChoiceKey';
  // static const String questionReference = 'additionalQuestionDataRef';
  // static const String isVerified = 'isVerified';

  // Solutions related fields
  static const String solutionRef = 'solutionsRef';
  static const String solutionData = 'solutionData';

  // Comment related fields
  static const String commentRef = 'commentsRef';
  static const String commentArray = 'commentsArray';
  static const String commentData = 'commentData';
  static const String commentInitials = 'commentInitials';
  static const String commentName = 'commentName';
  static const String upvotes = 'upvotesCount';

  // General fields
  static const String createdAt = 'createdAt';
  static const String createdBy = 'createdByRef';
  static const String updatedAt = 'updatedAt';
  static const String updatedBy = 'lastUpdatedByRef';
  static const String verifiedAt = 'verifiedAt';
  static const String verifiedBy = 'verifiedByRef';

  static String SUBJ2subject(SUBJ subj) {
    return subjects[subj] as String;
  }
}
