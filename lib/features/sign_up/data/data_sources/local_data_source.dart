import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/features/sign_up/data/models/signUpModel.dart';
import 'package:e_commerce_app/features/sign_up/domain/entities/sign_up_data.dart';

import 'data_soureses.dart';

class LocalDataSource implements SignUpDataSources {
  @override
  Future<Either<Failures, SignUpModel>> signUp(SignUpData signUpData) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
