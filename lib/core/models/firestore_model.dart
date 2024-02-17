class FireStore {
  //* Collection names in the Firestore
  static const List<String> subjects = [
    'mathematicsQuestions',
    'scienceQuestions',
    'readingComprehensionQuestions',
    'languageProficiencyQuestions'
  ];

  //* Field names of each document in the Firestore
  // Question related fields
  static const String questionReference = 'additionalQuestionDataRef';
  static const String question = 'question';
  static const String options = 'choices';
  static const String correctIndex = 'correctChoiceKey';
  static const String isVerified = 'isVerified';

  // User related fields
  static const String createdAt = 'createdAt';
  static const String createdBy = 'createdByRef';
  static const String updatedAt = 'updatedAt';
  static const String updatedBy = 'lastUpdatedByRef';
  static const String verifiedAt = 'verifiedAt';
  static const String verifiedBy = 'verifiedByRef';

  // Review related fields
  static const String solutions = 'solutionsRefs';
  static const String comments = 'commentsRef';
  static const String upvotes = 'upvotesCount';
}
