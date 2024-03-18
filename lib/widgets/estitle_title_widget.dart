import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takehome/core/image_constant.dart';
import 'package:takehome/core/theme/app_colors.dart';
import 'package:takehome/extensions.dart';
import 'package:takehome/widgets/custom_svg_widget.dart';

class EstateTileWidget extends StatelessWidget {
  const EstateTileWidget({
    super.key,
    required this.image,
    required this.title,
    required this.delay,
    required this.animate,
    this.width,
    this.padding,
  });

  final double? width;
  final EdgeInsetsGeometry? padding;
  final String image;
  final String title;
  final Duration delay;
  final bool animate;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: width?.w ?? 375.w,
      margin: EdgeInsets.only(bottom: 10.sp),
      padding:
          padding ?? const EdgeInsets.only(bottom: 10, left: 22, right: 22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60.sp),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60.sp),
                color: AppColors.primary50.withOpacity(0.5),
              ),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    30.w.spacingW,
                    Flexible(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.neutral,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      width: 47.w,
                      height: 47.h,
                      padding: EdgeInsets.all(13.sp),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary50,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.gray50,
                                blurRadius: 6,
                                spreadRadius: -1.76,
                                offset: Offset(-1.2, 0))
                          ]),
                      alignment: Alignment.center,
                      child: CustomSvgImageWidget(
                        imagePath: ImageConstants.arrowRight,
                        color: AppColors.gray50,
                      ),
                    )
                  ]),
            ),
          ),
        ),
      )
          .animate(delay: delay, target: animate ? 1 : 0)
          .scaleX(alignment: Alignment.centerLeft, begin: 0, end: 1),
    );
  }
}
