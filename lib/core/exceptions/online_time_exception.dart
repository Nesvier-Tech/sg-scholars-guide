import '../../constants/enums/online_time_sources_enum.dart';
import '../base_classes/exception_base.dart';

class OnlineTimeException extends ExceptionBase {
  const OnlineTimeException({
    required super.title,
    required super.message,
    required super.stackTrace,
    required OnlineTimeSourcesEnum onlineTimeSource,
  }) : _onlineTimeSource = onlineTimeSource;

  // Additional field.
  final OnlineTimeSourcesEnum _onlineTimeSource;

  // Additional getter.
  OnlineTimeSourcesEnum get onlineTimeSource => _onlineTimeSource;

  // Equatable props.
  @override
  List<Object?> get props => [title, message, stackTrace, onlineTimeSource];
}
