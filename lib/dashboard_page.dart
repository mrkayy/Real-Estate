import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:takehome/404_page.dart';
import 'package:takehome/core/image_constant.dart';
import 'package:takehome/core/theme/app_colors.dart';
// import 'package:takehome/home_pg.dart';
import 'package:takehome/home_sliver_pg.dart';
import 'package:takehome/search_pg.dart';
import 'package:takehome/widgets/custom_svg_widget.dart';
// import './extensions.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  static String path = '/dashboard';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animController1 = AnimationController(vsync: this);

  // Tween animate = Tween();

  int currentPageIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const [
            SearchPage(),
            NothingToSeePage(),
            HomeSliverPage(),
            NothingToSeePage(),
            NothingToSeePage()
          ][currentPageIndex],
          Positioned(
            left: 0,
            right: 0,
            bottom: 33.0.sp,
            child: SafeArea(
              child: Container(
                height: 60.0.h,
                margin: EdgeInsets.only(left: 63.0.sp, right: 63.0.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0.sp),
                  color: AppColors.gray100,
                ),
                child: NavigationBar(
                  indicatorColor: AppColors.primary,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  elevation: 0,
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                  indicatorShape: CircleBorder(),
                  onDestinationSelected: (selected) {
                    setState(() {
                      currentPageIndex = selected;
                    });
                  },
                  destinations: [
                    CustomBottomNavIcon(
                      icon: ImageConstants.searchBold,
                      selectedIndex: currentPageIndex,
                      index: 0,
                    ),
                    CustomBottomNavIcon(
                      icon: ImageConstants.chat,
                      selectedIndex: currentPageIndex,
                      index: 1,
                    ),
                    CustomBottomNavIcon(
                      icon: ImageConstants.home,
                      selectedIndex: currentPageIndex,
                      index: 2,
                    ),
                    CustomBottomNavIcon(
                      icon: ImageConstants.heart,
                      selectedIndex: currentPageIndex,
                      index: 3,
                    ),
                    CustomBottomNavIcon(
                      icon: ImageConstants.profile,
                      selectedIndex: currentPageIndex,
                      index: 4,
                    ),
                  ],
                  selectedIndex: currentPageIndex,
                ),
              ),
            ).animate(autoPlay: true, delay: const Duration(seconds: 2)).slideY(
                curve: Curves.easeInOut,
                duration: 7.6.seconds,
                end: 0.0,
                begin: 2.0),
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavIcon extends StatelessWidget {
  CustomBottomNavIcon(
      {super.key,
      required this.icon,
      required this.index,
      required this.selectedIndex});
  final String icon;
  final int index;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 42.0.w,
      height: 42.0.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              index == selectedIndex ? AppColors.primary : AppColors.neutral),
      child: NavigationDestination(
        label: '',
        icon: CustomSvgImageWidget(
          width: 22.0.sp,
          height: 22.0.sp,
          imagePath: icon,
        ),
      ),
    );
  }
}
