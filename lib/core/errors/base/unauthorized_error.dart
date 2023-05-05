import 'package:task/core/errors/domain_error.dart';

class UnauthorizedError extends DomainError {
  UnauthorizedError({String message = ''}) : super(message: message);
}
