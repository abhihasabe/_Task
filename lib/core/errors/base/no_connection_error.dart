import 'package:task/core/errors/domain_error.dart';

class NoConnectionError extends DomainError {
  NoConnectionError({String message = ''}) : super(message: message);
}
