import 'package:equatable/equatable.dart';

// TODO: [P3] Write a test for the ExceptionIntf abstract class.

/// [ExceptionIntf] should only be used in the Data layer.
/// It should not be used in the Domain layer and Presentation layer.
///
/// This abstract class should only be "extended" and not "implemented"
/// by an another class.
///
/// Properties _title,  _message, and _stackTrace are required for every [ExceptionIntf] objects.
/// You can add more properties on the concrete implementation of this [ExceptionIntf]
/// as you need it.
abstract class ExceptionIntf extends Equatable implements Exception {
  const ExceptionIntf({
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
