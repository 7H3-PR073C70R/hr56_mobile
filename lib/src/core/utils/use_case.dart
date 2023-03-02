// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:hr56_staff/src/core/error/failure.dart';

///
/// UseCase is called with Failure or some type of data representation
///
///
mixin UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

///
/// No params if the data object is in local cache
///
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
