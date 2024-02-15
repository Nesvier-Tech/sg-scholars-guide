import '../../constants/enums/auth_sources_enum.dart';
import '../base_classes/exception_base.dart';

class AuthException extends ExceptionBase {
  const AuthException({
    required super.title,
    required super.message,
    required super.stackTrace,
    required AuthSourcesEnum authSourcesEnum,
  }) : _authSourcesEnum = authSourcesEnum;

  // Additional field.
  final AuthSourcesEnum _authSourcesEnum;

  // Additional getter.
  AuthSourcesEnum get authSourcesEnum => _authSourcesEnum;

  // Equatable props.
  @override
  List<Object?> get props => [title, message, stackTrace, authSourcesEnum];
}
