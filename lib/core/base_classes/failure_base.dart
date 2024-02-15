import 'package:equatable/equatable.dart';

// TODO: [P3] Write a test for the FailureBase class.

/// [FailureBase] should only be used in the Data layer.
/// It should not be used in the Domain layer and Presentation layer.
///
/// Properties _title and _message are required for every [FailureBase] objects.
/// You can add more properties on the subclass of this [FailureBase]
/// as you see fit.
abstract class FailureBase extends Equatable implements Exception {
  const FailureBase({
    required String title,
    required String message,
  })  : _title = title,
        _message = message;

  // Fields.
  final String _title;
  final String _message;

  // Getters.
  String get title => _title;
  String get message => _message;

  // Equatable props.
  @override
  List<Object?> get props => [title, message];
}
