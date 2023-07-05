import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/features/home/domain/entities/SubCategoryEntity.dart';
import 'package:e_commerce_app/features/home/domain/repositories/home_domain_repo.dart';

class GetSubCategoriesUseCase{
  HomeDomainRepo homeDomainRepo;

  GetSubCategoriesUseCase(this.homeDomainRepo);

  Future<Either<Failures,SubCategoryEntity>> call(String categoryId)=>homeDomainRepo.getSubCategory(categoryId);
}