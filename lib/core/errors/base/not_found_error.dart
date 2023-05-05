import 'package:task/core/errors/domain_error.dart';

class NotFoundError extends DomainError {
  NotFoundError({String message = ''}) : super(message: message);
}
