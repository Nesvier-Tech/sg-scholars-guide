import 'package:equatable/equatable.dart';

// TODO: [P3] Write a test for the EntityIntf abstract class.

/// Ensures value based equality for entities.
/// All entities should implement this interface.
/// In other words, every Entity should be of type [Equatable].
abstract class EntityIntf extends Equatable {
  const EntityIntf();
}
