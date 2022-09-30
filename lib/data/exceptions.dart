import 'package:equatable/equatable.dart';

abstract class AppException extends Equatable {
  final String message;
  const AppException(this.message);

  @override
  List<Object> get props => [message];
}

class ServerException extends AppException {
  const ServerException(String message) : super(message);
}

class ConnectionException extends AppException {
  const ConnectionException(String message) : super(message);
}

class DatabaseException extends AppException {
  const DatabaseException(String message) : super(message);
}