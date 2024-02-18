import '../../../../base_classes/entity_base.dart';

class UserEntity extends EntityBase {
  const UserEntity({
    required String username,
    Map<String, String>? fullName,
    String? displayPictureURL,
    required Map<String, Map<String, dynamic>> emails,
    bool isPublic = true,
    required List<String> accountTypes,
    required DateTime createdAt,
    required DateTime updatedAt,
    bool isVerified = false,
    String? verifiedByRef,
    DateTime? verifiedAt,
    List<String>? createdQuestionsRefs,
    List<String>? updatedQuestionsRefs,
    List<String>? createdSolutionsRefs,
  })  : _username = username,
        _fullName = fullName,
        _displayPictureURL = displayPictureURL,
        _emails = emails,
        _isPublic = isPublic,
        _accountTypes = accountTypes,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _isVerified = isVerified,
        _verifiedByRef = verifiedByRef,
        _verifiedAt = verifiedAt,
        _createdQuestionsRefs = createdQuestionsRefs,
        _updatedQuestionsRefs = updatedQuestionsRefs,
        _createdSolutionsRefs = createdSolutionsRefs;

  // Fields.
  final String _username;
  final Map<String, String>? _fullName;
  final String? _displayPictureURL;
  final Map<String, Map<String, dynamic>> _emails;
  final bool _isPublic;
  final List<String> _accountTypes;
  final DateTime _createdAt, _updatedAt;
  final bool _isVerified;
  final String? _verifiedByRef;
  final DateTime? _verifiedAt;
  final List<String>? _createdQuestionsRefs;
  final List<String>? _updatedQuestionsRefs;
  final List<String>? _createdSolutionsRefs;

  // Getters.
  String get username => _username;
  Map<String, String>? get fullName => _fullName;
  String? get displayPictureURL => _displayPictureURL;
  Map<String, Map<String, dynamic>> get emails => _emails;
  bool get isPublic => _isPublic;
  List<String> get accountTypes => _accountTypes;
  DateTime get createdAt => _createdAt;
  DateTime get updatedAt => _updatedAt;
  bool get isVerified => _isVerified;
  String? get verifiedByRef => _verifiedByRef;
  DateTime? get verifiedAt => _verifiedAt;
  List<String>? get createdQuestionsRefs => _createdQuestionsRefs;
  List<String>? get updatedQuestionsRefs => _updatedQuestionsRefs;
  List<String>? get createdSolutionsRefs => _createdSolutionsRefs;

  // Equatable props.
  @override
  List<Object?> get props => [
        _username,
        _fullName,
        _displayPictureURL,
        _emails,
        _isPublic,
        _accountTypes,
        _createdAt,
        _updatedAt,
        _isVerified,
        _verifiedByRef,
        _verifiedAt,
        _createdQuestionsRefs,
        _updatedQuestionsRefs,
        _createdSolutionsRefs,
      ];
}
