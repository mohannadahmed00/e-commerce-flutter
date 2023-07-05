import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/features/home/data/data_sources/remote_dto.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/states.dart';
import 'package:e_commerce_app/features/login/domain/entities/login_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeScreen extends StatelessWidget {
  final LoginEntity? loginEntity;

  const HomeScreen(this.loginEntity, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(RemoteDto())..getCategories()..getProducts(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          if(state is HomeGetCategoriesSuccessState){
            HomeCubit.get(context).getSubCategory(state.model.data?[0].id??"");
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Image.asset(AppImages.blueLogo,width: 66.w,height: 22.h,),backgroundColor: Colors.white,elevation: 0,),
            body: HomeCubit.get(context).tabs[HomeCubit.get(context).tabIndex],
            bottomNavigationBar: SizedBox(
              height: 75.h,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: AppColors.primary,
                onTap: (value) {
                  HomeCubit.get(context).changeTab(value);
                },
                currentIndex: HomeCubit.get(context).tabIndex,
                items: [
                  BottomNavigationBarItem(
                      backgroundColor: AppColors.primary,
                      icon: HomeCubit.get(context).tabIndex==0?Container(decoration: BoxDecoration(color:AppColors.onPrimary,borderRadius: BorderRadius.circular(50)),child: Image.asset(AppImages.icHome,width: 40.w,height: 40.h,)):Image.asset(AppImages.unIcHome,width: 40.w,height: 40.h,),
                      label: ""),
                  BottomNavigationBarItem(
                      backgroundColor: AppColors.primary,
                      icon: HomeCubit.get(context).tabIndex==1?Container(decoration: BoxDecoration(color:AppColors.onPrimary,borderRadius: BorderRadius.circular(50)),child: Image.asset(AppImages.icCategory,width: 40.w,height: 40.h,)):Image.asset(AppImages.unIcCategory,width: 40.w,height: 40.h,),
                      label: ""),
                  BottomNavigationBarItem(
                      backgroundColor: AppColors.primary,
                      icon: HomeCubit.get(context).tabIndex==2?Container(decoration: BoxDecoration(color:AppColors.onPrimary,borderRadius: BorderRadius.circular(50)),child: Image.asset(AppImages.icLikes,width: 40.w,height: 40.h,)):Image.asset(AppImages.unIcLikes,width: 40.w,height: 40.h,),
                      label: ""),
                  BottomNavigationBarItem(
                      backgroundColor: AppColors.primary,
                      icon: HomeCubit.get(context).tabIndex==3?Container(decoration: BoxDecoration(color:AppColors.onPrimary,borderRadius: BorderRadius.circular(50)),child: Image.asset(AppImages.icProfile,width: 40.w,height: 40.h,)):Image.asset(AppImages.unIcProfile,width: 40.w,height: 40.h,),
                      label: ""),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
