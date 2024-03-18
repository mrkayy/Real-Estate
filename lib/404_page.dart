import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takehome/core/image_constant.dart';
import 'package:takehome/core/theme/app_colors.dart';
import 'package:takehome/extensions.dart';
import 'package:takehome/widgets/custom_svg_widget.dart';

class NothingToSeePage extends StatelessWidget {
  static String path = '/404';
  const NothingToSeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CustomSvgImageWidget(
            height: 50.0,
            width: 50.0,
            imagePath: ImageConstants.search,
          ),
          8.h.spacingH,
          const Center(
            child: Text(
              'Nothing to see here!',
              style: TextStyle(color: AppColors.neutral, fontSize: 14),
            ),
          ).animate(effects: [FadeEffect(), ShakeEffect()]),
        ],
      ),
    );
  }
}
