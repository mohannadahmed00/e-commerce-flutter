import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/features/home/domain/entities/CategoryEntity.dart';
import 'package:e_commerce_app/features/home/domain/repositories/home_domain_repo.dart';

class GetBrandsUseCase {
  HomeDomainRepo homeDomainRepo;

  GetBrandsUseCase(this.homeDomainRepo);

  Future<Either<Failures, CategoryOrBrandEntity>> call() =>
      homeDomainRepo.getBrands();
}
