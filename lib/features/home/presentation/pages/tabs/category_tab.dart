import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/components.dart';
import 'package:e_commerce_app/core/utils/text_styles.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 348.w,
                      height: 50.h,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            margin: EdgeInsets.only(
                              left: 24.07.w,
                              top: 13.h,
                              bottom: 13.h,
                              right: 7.93.w,
                            ),
                            child: Image.asset(
                              AppImages.search,
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                          hintText: 'what do you search for?',
                          hintStyle: poppins14W300(color: AppColors.hintColor),
                          filled: true,
                          contentPadding: const EdgeInsets.only(top: 20.0),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.r),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.r),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.r),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        AppImages.cart,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: HomeCubit.get(context).isSubCategoryTab
                      ? HomeCubit.get(context).subProducts.isNotEmpty
                          ? GridView.builder(
                              scrollDirection: Axis.vertical,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 191.w / 237.h,
                              ),
                              itemCount:
                                  HomeCubit.get(context).subProducts.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  productCard(HomeCubit.get(context)
                                      .subProducts[index]))
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.warning_rounded,
                                  color: Colors.yellow,
                                  size: 70,
                                ),
                                Text(
                                  "No Products",
                                  style: poppins20W600(),
                                )
                              ],
                            )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 137.w,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      itemBuilder: (_, index) =>
                                          GestureDetector(
                                              onTap: () {
                                                HomeCubit.get(context)
                                                    .selectMenuItem(index);
                                              },
                                              child: menuItem(
                                                  HomeCubit.get(context)
                                                          .categories[index]
                                                          .name ??
                                                      "null",
                                                  HomeCubit.get(context)
                                                          .selectedMenuIndex ==
                                                      index,
                                                  index)),
                                      itemCount: HomeCubit.get(context)
                                          .categories
                                          .length,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 24.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    HomeCubit.get(context)
                                            .categories[HomeCubit.get(context)
                                                .selectedMenuIndex]
                                            .name ??
                                        "null",
                                    style: poppins18W500(),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Stack(
                                    children: [
                                      Image.asset(
                                        AppImages.categoryCover,
                                        fit: BoxFit.fill,
                                        height: 94.h,
                                        width: double.infinity,
                                      ),
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 8.h, horizontal: 16.w),
                                          width: 105.w, //it's from me!!
                                          height: 40.h,
                                          child: Text(
                                            HomeCubit.get(context)
                                                    .categories[
                                                        HomeCubit.get(context)
                                                            .selectedMenuIndex]
                                                    .name ??
                                                "null",
                                            style: poppins16W600()
                                                .copyWith(height: 1),
                                          )),
                                      Positioned(
                                        bottom: 8.h,
                                        left: 16.w,
                                        child: SizedBox(
                                          width: 97.w,
                                          height: 30.h,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Add your onPressed function here
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(AppColors.primary),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              'Shop Now',
                                              style: poppins12W400().copyWith(
                                                  color: AppColors.onPrimary),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Expanded(
                                    child: HomeCubit.get(context)
                                            .subCategory
                                            .isNotEmpty
                                        ? GridView.builder(
                                            scrollDirection: Axis.vertical,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 13.0,
                                              childAspectRatio: 70.w / 122.h,
                                            ),
                                            itemCount: HomeCubit.get(context)
                                                .subCategory
                                                .length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  HomeCubit.get(context)
                                                      .getSubCategoryProducts(
                                                          index);
                                                },
                                                child: Column(
                                                  children: [
                                                    ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.r),
                                                        child: Image.asset(
                                                          AppImages.subCategory,
                                                          width: 70.w,
                                                          height: 70.h,
                                                        )),
                                                    SizedBox(
                                                      height: 8.h,
                                                    ),
                                                    Text(
                                                      HomeCubit.get(context)
                                                              .subCategory[
                                                                  index]
                                                              .name ??
                                                          "null",
                                                      style: poppins12W400(),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                          )
                                        : Column(
                                            children: [
                                              const Icon(
                                                Icons.warning_rounded,
                                                color: Colors.yellow,
                                                size: 70,
                                              ),
                                              Text(
                                                "No Sub-Categories",
                                                style: poppins20W600(),
                                              )
                                            ],
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              )
            ],
          );
        });
  }
}
//menuItem("Women's Fashion",true,0)
//Image.asset(AppImages.subCategory)
//Row(
//           children: [
//             ListView.builder(
//               itemBuilder: (_, index) => Text("data"),
//               itemCount: 10,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Text("data"),
//                 Image.asset(
//                   AppImages.categoryCover,
//                   width: 237.w,
//                   height: 94.h,
//                 ),
//                 GridView.builder(
//                   scrollDirection: Axis.vertical,
//                   gridDelegate:
//                   const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                   ),
//                   itemCount: 10,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Image.asset(AppImages.subCategory);
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
