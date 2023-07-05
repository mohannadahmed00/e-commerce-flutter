import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/components.dart';
import 'package:e_commerce_app/core/utils/text_styles.dart';
import 'package:e_commerce_app/features/home/presentation/manager/cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
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
                                    right: 7.93.w),
                                child: Image.asset(
                                  AppImages.search,
                                  width: 24.w,
                                  height: 24.h,
                                )),
                            hintText: 'what do you search for?',
                            hintStyle:
                                poppins14W300(color: AppColors.hintColor),
                            filled: true,
                            contentPadding: const EdgeInsets.only(top: 20.0),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.r),
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.r),
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.r),
                              borderSide: const BorderSide(
                                  color: AppColors.primary, width: 1),
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
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ImageSlideshow(
                      height: 200.h,
                      autoPlayInterval: 5000,
                      isLoop: true,
                      indicatorColor: AppColors.primary,
                      indicatorBackgroundColor: Colors.white,
                      children: HomeCubit.get(context).sliders.map((i) {
                        return Image.asset(i,fit: BoxFit.fill,);
                      }).toList()),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.h, right: 17.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: poppins18W500(),
                      ),
                      Text(
                        "view all",
                        style: poppins12W400(),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 280.h,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: HomeCubit.get(context).categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Stack(
                            children: [
                              Shimmer(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.grey[300]!,
                                      Colors.grey[100]!,
                                      Colors.grey[300]!
                                    ],
                                    stops: const [0.1, 0.5, 0.9],
                                  ),
                                  child: Container(
                                    width: 100.w,
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                  )),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50.r),
                                child: FadeInImage.memoryNetwork(
                                  image: HomeCubit.get(context)
                                          .categories[index]
                                          .image ??
                                      "",
                                  width: 100.w,
                                  height: 100.h,
                                  placeholder: kTransparentImage,
                                  fit: BoxFit.cover,
                                ),
                                //backgroundImage: NetworkImage(HomeCubit.get(context).categories[index].image ?? "")
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            HomeCubit.get(context).categories[index].name ?? "",
                            style: poppins14W400(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  width: double.infinity,
                  child: Text(
                    "Home Appliance",
                    textAlign: TextAlign.start,
                    style: poppins18W500(),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                    height: 225.h,
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          productCard(HomeCubit.get(context).products[index]),
                      itemCount: HomeCubit.get(context).products.length,
                      scrollDirection: Axis.horizontal,
                    ))
              ],
            ),
          );
        });
  }
}
