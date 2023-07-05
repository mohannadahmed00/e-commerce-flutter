import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LikesTab extends StatelessWidget {
  const LikesTab({super.key});

  @override
  Widget build(BuildContext context) {
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
                            right: 7.93.w),
                        child: Image.asset(
                          AppImages.search,
                          width: 24.w,
                          height: 24.h,
                        )),
                    hintText: 'what do you search for?',
                    hintStyle: poppins14W300(color: AppColors.hintColor),
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
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
