import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takehome/core/image_constant.dart';
import 'package:takehome/core/theme/app_colors.dart';
import 'package:takehome/extensions.dart';
import 'package:takehome/widgets/custom_svg_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.duration,
    super.key,
  }) : type = AppBarType.appbar;
  const CustomAppBar.searchBar({
    this.duration,
    super.key,
  }) : type = AppBarType.searchbar;

  final AppBarType type;
  final Duration? duration;

  @override
  Widget build(BuildContext context) {
    return {
      AppBarType.appbar: _buildAppBar(context),
      AppBarType.searchbar: _buildSearchBar(context),
    }[type]!;
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
      // margin: EdgeInsets.only(top: 44.0.sp),
      constraints: const BoxConstraints.expand(),
      // height: 103.0.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 42.0.h,
            width: 145.0.w,
            padding: EdgeInsets.symmetric(horizontal: 14.0.sp),
            decoration: BoxDecoration(
                color: AppColors.primary50,
                borderRadius: BorderRadius.circular(8.0.sp)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomSvgImageWidget(
                  imagePath: ImageConstants.locationBold,
                  height: 12.0.sp,
                  width: 12.0.sp,
                  color: AppColors.secondary,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Lagos, Nigeria',
                    style: TextStyle(
                        fontFamily: 'Euclid',
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ).animate(delay: const Duration(milliseconds: 300)).fadeIn(),
          ).animate().scaleX(begin: 0, end: 1, alignment: Alignment.centerLeft),
          Container(
            width: 45.0.w,
            height: 45.0.h,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.orangeAccent.shade100),
            child: CustomSvgImageWidget(
              imagePath: ImageConstants.avatar,
            ),
          ).animate().scale(duration: duration)
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      // height: 59.0.h,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
      // margin: EdgeInsets.only(top: 44.0.sp),
      constraints: const BoxConstraints.expand(),
      // height: 103.0.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          38.w.spacingW,
          Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  prefixIcon: Transform.scale(
                    scale: 0.5,
                    child: CustomSvgImageWidget(
                      color: AppColors.gray100,
                      imagePath: ImageConstants.search,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.sp),
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0.sp),
                    ),
                  ),
                  hintText: 'Search reservation'),
            ).animate().scale(duration: duration),
          ),
          18.w.spacingW,
          Container(
            height: 45.h,
            width: 45.w,
            padding: EdgeInsets.all(12.sp),
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: CustomSvgImageWidget(
              color: AppColors.gray100,
              imagePath: ImageConstants.filter,
            ),
          ).animate().scale(duration: duration),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 103.sp);
}

enum AppBarType { appbar, searchbar }
