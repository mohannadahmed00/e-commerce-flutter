import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/text_styles.dart';
import 'package:e_commerce_app/features/home/domain/entities/ProductEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Widget defaultFormField(
        {required TextEditingController controller,
        required String label,
        required Function validate,
        bool isPassword = false}) =>
    TextFormField(
      controller: controller,
      validator: (value) {
        validate(value);
        return null;
      },
      obscureText: isPassword,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: label,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(12))),
    );

Widget productCard(ProductDataEntity product) {
  return Container(
      margin: EdgeInsets.only(left: 16.w),
      width: 158.w,
      height: 211.h,
      child: Stack(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r)),
                    child: Image.network(
                      product.imageCover ?? "",
                      fit: BoxFit.cover,
                      width: 158.w,
                      height: 122.h,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          //_isLoading = false;
                          return child;
                        }
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 158.w,
                            height: 122.h,
                            color: Colors.white,
                          ),
                          //period: Duration(milliseconds: 1000),
                        );
                      },
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "${product.title}",
                        style: poppins14W400(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Row(
                        children: [
                          Text(
                            "Review (${product.ratingsAverage})",
                            style: poppins12W400(),
                          ),
                          SizedBox(
                            width: 14.w,
                          ),
                          Image.asset(
                            AppImages.star,
                            width: 15.w,
                            height: 15.h,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        "EGP ${product.price}",
                        style: poppins12W400(),
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              right: 8.w,
              top: 8.h,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.onPrimary,
                  borderRadius: BorderRadius.circular(50.r)
                ),
                child: Image.asset(
                  AppImages.icLikes,
                  fit: BoxFit.fill,
                  width: 16.w,
                  height: 16.h,
                ),
              )),
          Positioned(
              right: 8.w,
              bottom: 8.h,
              child: Image.asset(
                AppImages.add,
                width: 30.w,
                height: 30.h,
              )),
        ],
      ));
}

Widget menuItem(String category, bool isSelected, int itemIndex) {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: isSelected ? 0.w : 7.w),
    width: 137.w,
    height: 82.h,
    decoration: BoxDecoration(
      color: isSelected ? AppColors.onPrimary : AppColors.menuColor,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(itemIndex == 0 ? 10.r : 0.r)),
    ),
    child: Row(
      children: [
        Visibility(
          visible: isSelected,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            width: 7.w,
            height: 72.h,
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20.r)),
          ),
        ),
        SizedBox(width: 98.w, child: Text(category, style: poppins14W500())),
      ],
    ),
  );
}

/*Image.network(
                          product.imageCover ?? "",
                          fit: BoxFit.scaleDown,
                        )*/
