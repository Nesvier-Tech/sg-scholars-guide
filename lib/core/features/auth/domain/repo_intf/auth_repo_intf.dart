import 'package:fpdart/fpdart.dart';

import '../../../../failures/auth_failure.dart';

abstract class AuthRepoIntf {
  const AuthRepoIntf();

  Future<Either<AuthFailure, void>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}
