import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.username,
    super.fullName,
    super.displayPictureURL,
    required super.emails,
    super.isPublic,
    required super.accountTypes,
    required super.createdAt,
    required super.updatedAt,
    super.isVerified,
    super.verifiedByRef,
    super.verifiedAt,
    super.createdQuestionsRefs,
    super.updatedQuestionsRefs,
    super.createdSolutionsRefs,
  });

  // TODO: [P1] Re-check the types.
  factory UserModel.formUserCredential(UserCredential userCredential) {
    return UserModel(
      uid: userCredential.user!.uid,
      username: userCredential.user!.displayName!,
      fullName: {
        'firstName': userCredential.user!.displayName!.split(' ')[0],
        'lastName': userCredential.user!.displayName!.split(' ')[1],
      },
      displayPictureURL: userCredential.user!.photoURL,
      emails: {
        userCredential.user!.email!: {
          'isVerified': userCredential.user!.emailVerified,
          'isPrimary': true,
        }
      },
      isPublic: true,
      accountTypes: ['email'],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isVerified: userCredential.user!.emailVerified,
      verifiedByRef: null,
      verifiedAt: userCredential.user!.metadata.creationTime,
      createdQuestionsRefs: null,
      updatedQuestionsRefs: null,
      createdSolutionsRefs: null,
    );
  }

  // TODO: [P1] Re-check the types.
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      username: map['username'] as String,
      fullName: map['fullName'] as Map<String, String>?,
      displayPictureURL: map['displayPictureURL'] as String?,
      emails: map['emails'] as Map<String, Map<String, dynamic>>,
      isPublic: map['isPublic'] as bool,
      accountTypes:
          (map['accountTypes'] as List).map((e) => e as String).toList(),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: (map['updatedAt'] as Timestamp).toDate(),
      isVerified: map['isVerified'] as bool,
      verifiedByRef: map['verifiedByRef'] as String?,
      verifiedAt: (map['verifiedAt'] as Timestamp?)?.toDate(),
      createdQuestionsRefs: (map['createdQuestionsRefs'] as List?)
          ?.map((e) => e as String)
          .toList(),
      updatedQuestionsRefs: (map['updatedQuestionsRefs'] as List?)
          ?.map((e) => e as String)
          .toList(),
      createdSolutionsRefs: (map['createdSolutionsRefs'] as List?)
          ?.map((e) => e as String)
          .toList(),
    );
  }
}
