import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:e_commerce_app/features/home/data/data_sources/home_data_sources.dart';
import 'package:e_commerce_app/features/home/data/models/SubCategoryModel.dart';
import 'package:e_commerce_app/features/home/domain/entities/CategoryEntity.dart';
import 'package:e_commerce_app/features/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce_app/features/home/domain/repositories/home_domain_repo.dart';

class HomeDataRepo implements HomeDomainRepo {
  HomeDataSources homeDataSources;

  HomeDataRepo(this.homeDataSources);

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getBrands() =>
      homeDataSources.getBrands();

  @override
  Future<Either<Failures, CategoryOrBrandEntity>> getCategories() =>
      homeDataSources.getCategories();

  @override
  Future<Either<Failures, ProductEntity>> getProducts() =>homeDataSources.getProducts();

  @override
  Future<Either<Failures, SubCategoryModel>> getSubCategory(String categoryId) => homeDataSources.getSubCategory(categoryId);
}
