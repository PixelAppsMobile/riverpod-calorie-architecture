import 'package:dartz/dartz.dart';
import 'package:totaltest/core/result_type.dart';

///
/// The abstract UseCase to be implemented by use cases that return [Either].
/// [T] Is the type to be returned by the UseCase.
/// [S] is the parameter passed to use case
///
abstract class UseCase<T, S> {
  Future<Either<AppError, T>> call(S param);
}

///
/// The abstract NoParamUseCase to be implemented by use cases that return [Either] without any param.
/// [T] Is the type to be returned by the UseCase.
///
abstract class NoParamUseCase<T> {
  Future<Either<AppError, T>> call();
}

///
/// The abstract UseCase to be implemented by use cases that return [T].
/// [T] Is the type to be returned by the UseCase.
/// [S] is the parameter passed to use case
///
abstract class UseCaseSimple<T, S> {
  T call(S params);
}

///
/// The abstract NoParamUseCaseSimple to be implemented by use cases that return [T].
/// [T] Is the type to be returned by the UseCase.
///
abstract class NoParamUseCaseSimple<T> {
  T call();
}
