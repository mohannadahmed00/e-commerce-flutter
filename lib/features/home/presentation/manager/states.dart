import 'package:e_commerce_app/features/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce_app/features/home/domain/entities/SubCategoryEntity.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/CategoryEntity.dart';

abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeGetCategoriesSuccessState extends HomeStates {
  CategoryOrBrandEntity model;

  HomeGetCategoriesSuccessState(this.model);
}

class HomeGetCategoriesErrorState extends HomeStates {
  Failures failures;

  HomeGetCategoriesErrorState(this.failures);
}

class HomeGetCategoriesLoadingState extends HomeStates {}


class HomeGetSubCategorySuccessState extends HomeStates {
  SubCategoryEntity model;

  HomeGetSubCategorySuccessState(this.model);
}

class HomeGetSubCategoryErrorState extends HomeStates {
  Failures failures;

  HomeGetSubCategoryErrorState(this.failures);
}

class HomeGetSubCategoryLoadingState extends HomeStates {}




class HomeGetBrandsSuccessState extends HomeStates {
  CategoryOrBrandEntity model;

  HomeGetBrandsSuccessState(this.model);
}

class HomeGetBrandsErrorState extends HomeStates {
  Failures failures;

  HomeGetBrandsErrorState(this.failures);
}

class HomeGetBrandsLoadingState extends HomeStates {}

class HomeGetProductsSuccessState extends HomeStates {
  ProductEntity model;

  HomeGetProductsSuccessState(this.model);
}

class HomeGetProductsErrorState extends HomeStates {
  Failures failures;

  HomeGetProductsErrorState(this.failures);
}

class HomeGetProductsLoadingState extends HomeStates {}

class HomeChangeTabState extends HomeStates {}

class HomeChangeCategoryState extends HomeStates {}
