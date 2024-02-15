import 'package:equatable/equatable.dart';

/// Ensures value based equality for parameters.
///
/// All use cases' parameters should be of type [ParamsBase].
class ParamsBase extends Equatable {
  const ParamsBase();

  @override
  List<Object?> get props => [];
}
