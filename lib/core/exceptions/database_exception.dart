import '../../constants/enums/database_sources_enum.dart';
import '../base_classes/exception_base.dart';

class DataBaseException extends ExceptionBase {
  const DataBaseException({
    required super.title,
    required super.message,
    required super.stackTrace,
    required DatabaseSourcesEnum dataBaseSource,
  }) : _dataBaseSource = dataBaseSource;

  // Additional field.
  final DatabaseSourcesEnum _dataBaseSource;

  // Additional getter.
  DatabaseSourcesEnum get dataBaseSource => _dataBaseSource;

  // Equatable props.
  @override
  List<Object?> get props => [title, message, stackTrace, dataBaseSource];
}
