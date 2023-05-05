import 'package:task/core/errors/domain_error.dart';

class InvalidDataError extends DomainError {
  InvalidDataError({String message = ''}) : super(message: message);
}
