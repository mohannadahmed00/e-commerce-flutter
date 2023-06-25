import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/features/sign_up/data/data_sources/data_soureses.dart';
import 'package:e_commerce_app/features/sign_up/data/models/signUpModel.dart';
import 'package:e_commerce_app/features/sign_up/domain/entities/sign_up_data.dart';
import 'package:e_commerce_app/features/sign_up/domain/repositories/sign_up_domain_repo.dart';

class SignUpDataRepo implements SignUpDomainRepo {
  SignUpDataSources sources;

  SignUpDataRepo(this.sources);

  @override
  Future<Either<Failures, SignUpModel>> signUp(SignUpData signUpData) =>
      sources.signUp(signUpData);
}
