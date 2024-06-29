import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike/core/utils/colors/app_colors.dart';
import 'package:nike/core/utils/const/app_constants.dart';
import 'package:nike/core/utils/const/app_styles.dart';
import 'package:nike/core/utils/strings/app_strings.dart';
import 'package:nike/features/onboarding/data/models/onboarding.dart';
import 'package:nike/features/onboarding/presentation/widgets/navigation_button.dart';
import 'package:svg_flutter/svg.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemBuilder: (_, index) {
                  return Transform.scale(
                    scale: 1.2,
                    child: SvgPicture.asset(
                      onboardingData[index].image,
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 20.h,
              right: 20.w,
              left: 20.w,
              child: NavigationButton(
                height: AppStyles.height30(context) * 2.3,
                width: MediaQuery.of(context).size.width * 0.9,
                backgroundColor: AppColors.whiteColor,
                onPressed: () {
                  if (currentIndex == onboardingData.length - 1) {
                    Navigator.pushNamed(context, AppConstants.loginRoute);
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
                child: Text(
                  currentIndex == onboardingData.length - 1
                      ? AppStrings.getStartedString
                      : AppStrings.nextString,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 100.h,
              left: 20.w,
              right: 20.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(2);
                  },
                  child: Text(
                    AppStrings.skipString,
                    style: TextStyle(
                      fontSize: 16,
                      color: currentIndex == onboardingData.length - 1 ||
                              currentIndex == onboardingData.length - 2
                          ? AppColors.secondaryColor
                          : AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5.w),
      width: currentIndex == index ? 35 : 25,
      height: 8,
      decoration: BoxDecoration(
        color:
            currentIndex == index ? AppColors.dotColor : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
