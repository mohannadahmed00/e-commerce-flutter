import 'package:e_commerce_app/features/home/data/data_sources/home_data_sources.dart';
import 'package:e_commerce_app/features/home/data/repositories/home_data_repo.dart';
import 'package:e_commerce_app/features/home/domain/entities/CategoryEntity.dart';
import 'package:e_commerce_app/features/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce_app/features/home/domain/entities/SubCategoryEntity.dart';
import 'package:e_commerce_app/features/home/domain/repositories/home_domain_repo.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_brands_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_categories_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_products_use_case.dart';
import 'package:e_commerce_app/features/home/domain/use_cases/get_sub_catergory_use_case.dart';
import 'package:e_commerce_app/features/home/presentation/manager/states.dart';
import 'package:e_commerce_app/features/home/presentation/pages/tabs/category_tab.dart';
import 'package:e_commerce_app/features/home/presentation/pages/tabs/home_tab.dart';
import 'package:e_commerce_app/features/home/presentation/pages/tabs/likes_tab.dart';
import 'package:e_commerce_app/features/home/presentation/pages/tabs/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_assets.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeDataSources homeDataSources;
  late HomeDomainRepo homeDomainRepo;

  HomeCubit(this.homeDataSources) : super(HomeInitState()) {
    homeDomainRepo = HomeDataRepo(homeDataSources);
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  bool isSubCategoryTab = false;

  void getSubCategoryProducts(int subCategoryIndex){
    isSubCategoryTab = true;
    String? subId = subCategory[subCategoryIndex].sId;
    // print(subId);
    // print(products.length);
    // for(int i = 0 ; i<products.length;i++){
    //   print("subProduct id of product: ${products[i].subcategory?[0].sId??"null"}");
    // }
    subProducts = products.where((element) => element.subcategory![0].sId==subId).toList();
    //print(subProducts.length);
    emit(HomeGetSubCategoryLoadingState());
    //getProducts();
  }

  int tabIndex = 0;

  int selectedMenuIndex = 0;

  List<Widget> tabs = [
    const HomeTab(),
    const CategoryTab(),
    const LikesTab(),
    const ProfileTab(),
  ];

  List<DataEntity> categories = [];

  List<SubDataEntity> subCategory = [];

  List<ProductDataEntity> products = [];

  List<ProductDataEntity> subProducts = [];

  List<String> sliders = [
    AppImages.sliderOne,
    AppImages.sliderTwo,
    AppImages.sliderThree
  ];

  void selectMenuItem(int index){
    selectedMenuIndex = index;
    emit(HomeChangeCategoryState());
    getSubCategory(categories[index].id??"");
  }

  void changeTab(int index){
    isSubCategoryTab = false;
    tabIndex = index;
    emit(HomeChangeTabState());
  }


  void getBrands() async {
    GetBrandsUseCase getBrandsUseCase = GetBrandsUseCase(homeDomainRepo);
    var result = await getBrandsUseCase.call();
    result.fold((l) {
      emit(HomeGetBrandsErrorState(l));
    }, (r) {
      emit(HomeGetBrandsSuccessState(r));
    });
  }

  void getCategories() async {
    emit(HomeGetCategoriesLoadingState());
    HomeDomainRepo homeDomainRepo = HomeDataRepo(homeDataSources);
    GetCategoriesUseCase getCategoriesUseCase =
        GetCategoriesUseCase(homeDomainRepo);
    var result = await getCategoriesUseCase.call();
    result.fold((l) {
      emit(HomeGetCategoriesErrorState(l));
    }, (r) {
      categories = r.data ?? [];
      emit(HomeGetCategoriesSuccessState(r));
    });
  }

  void getProducts() async {
    emit(HomeGetProductsLoadingState());
    HomeDomainRepo homeDomainRepo = HomeDataRepo(homeDataSources);
    GetProductsUseCase getProductsUseCase =
    GetProductsUseCase(homeDomainRepo);
    var result = await getProductsUseCase.call();
    result.fold((l) {
      emit(HomeGetProductsErrorState(l));
    }, (r) {
      products = r.data ?? [];
      emit(HomeGetProductsSuccessState(r));
    });
  }

  void getSubCategory(String categoryId) async {
    emit(HomeGetSubCategoryLoadingState());
    HomeDomainRepo homeDomainRepo = HomeDataRepo(homeDataSources);
    GetSubCategoriesUseCase getSubCategoriesUseCase =
    GetSubCategoriesUseCase(homeDomainRepo);
    var result = await getSubCategoriesUseCase.call(categoryId);
    result.fold((l) {
      emit(HomeGetSubCategoryErrorState(l));
    }, (r) {
      subCategory = r.data ?? [];
      emit(HomeGetSubCategorySuccessState(r));
    });
  }
}
