import '../core/interfaces/params_intf.dart';

// TODO: [P3] Write a test for the NoParams class.

/// When a use case does not require any parameters, this class should be used.
class NoParams implements ParamsIntf {
  const NoParams();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => null;
}
