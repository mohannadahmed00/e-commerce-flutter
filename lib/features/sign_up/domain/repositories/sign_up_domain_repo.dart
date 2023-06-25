import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/features/sign_up/domain/entities/SignUpEntity.dart';
import 'package:e_commerce_app/features/sign_up/domain/entities/sign_up_data.dart';

abstract class SignUpDomainRepo {
  Future<Either<Failures, SignUpEntity>> signUp(SignUpData signUpData);
}
