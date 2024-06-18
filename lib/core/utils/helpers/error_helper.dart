import 'package:lepaya/core/extension/enum_extension.dart';
import 'package:lepaya/core/extension/stack_trace_extension.dart';
import 'package:lepaya/core/utils/enums.dart';
import 'dart:developer' as developer;

class ErrorHelper {
  static void printDebugError({
    String message = '',
    ErrorLevels level = ErrorLevels.DEBUG,
    String name = '',
    Object? error,
    StackTrace? stackTrace,
  }) {
    developer.log(
      message,
      name: name,
      error: error,
      level: level.getLevelInteger(),
      stackTrace: stackTrace?.limitStackTracePrint(),
    );
  }
}
