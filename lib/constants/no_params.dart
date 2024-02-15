import '../core/base_classes/params_base.dart';

// TODO: [P3] Write a test for the NoParams class.

/// When a use case does not require any parameters, this class should be used.
class NoParams implements ParamsBase {
  const NoParams();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => null;
}
