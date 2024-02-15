import 'package:equatable/equatable.dart';

// TODO: [P3] Write a test for the ExceptionBase class.

/// [ExceptionBase] should only be used in the Data layer.
/// It should not be used in the Domain layer and Presentation layer.
///
/// Properties _title,  _message, and _stackTrace are required for every [ExceptionBase] objects.
/// You can add more properties on the concrete implementation of this [ExceptionBase]
/// as you need it.ExceptionBase
abstract class ExceptionBase extends Equatable implements Exception {
  const ExceptionBase({
    required String title,
    required String message,
    required StackTrace stackTrace,
  })  : _title = title,
        _message = message,
        _stackTrace = stackTrace;

  // Fields.
  final String _title;
  final String _message;
  final StackTrace _stackTrace;

  // Getters.
  String get title => _title;
  String get message => _message;
  StackTrace get stackTrace => _stackTrace;

  // Equatable props.
  @override
  List<Object?> get props => [title, message, stackTrace];
}
