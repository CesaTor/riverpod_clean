import 'package:fpdart/fpdart.dart';

class AppError {
  final String message;

  AppError(this.message);
}

typedef AppEither<T> = Either<AppError, T>;

typedef AppTask<T> = TaskEither<AppError, T>;
