import 'params_intf.dart';

// TODO: [P3] Write a test for the UseCaseIntf abstract class.

/// All use cases should implement this interface.
abstract class UseCaseIntf<T, P extends ParamsIntf> {
  const UseCaseIntf();

  /// Calls the use case (i.e., executes the use case).
  ///
  /// Callable classes are classes that provide a [call] method.
  /// You can call an instance of a callable class as if it were a function.
  T call(P params);
}
