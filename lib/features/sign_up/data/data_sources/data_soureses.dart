import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/features/sign_up/data/models/signUpModel.dart';
import 'package:e_commerce_app/features/sign_up/domain/entities/sign_up_data.dart';

abstract class SignUpDataSources {
  Future<Either<Failures, SignUpModel>> signUp(SignUpData signUpData);
}
