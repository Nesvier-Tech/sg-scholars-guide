import 'package:equatable/equatable.dart';

// TODO: [P3] Write a test for the FailureIntf abstract class.

/// [FailureIntf] should be used in the Domain layer and Presentation layer.
/// It should not be used in the Data layer.
///
/// This abstract class should only be "extended" and not "implemented"
/// by an another class.
///
/// Properties _title and _message are required for every [FailureIntf] objects.
/// You can add more properties on the concrete implementation of this [FailureIntf]
/// as you need it.
abstract class FailureIntf extends Equatable {
  const FailureIntf({
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
