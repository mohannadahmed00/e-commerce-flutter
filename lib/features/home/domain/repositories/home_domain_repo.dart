import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/features/home/domain/entities/CategoryEntity.dart';
import 'package:e_commerce_app/features/home/domain/entities/SubCategoryEntity.dart';

import '../entities/ProductEntity.dart';

abstract class HomeDomainRepo {
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories();

  Future<Either<Failures, CategoryOrBrandEntity>> getBrands();

  Future<Either<Failures,ProductEntity>> getProducts();

  Future<Either<Failures,SubCategoryEntity>> getSubCategory(String categoryId);
}
