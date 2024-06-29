import 'package:flutter/material.dart';
import 'package:nike/core/utils/assets/app_icons.dart';
import 'package:nike/core/utils/colors/app_colors.dart';
import 'package:nike/core/utils/const/app_constants.dart';
import 'package:nike/core/utils/const/app_styles.dart';
import 'package:svg_flutter/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
      (_) => Navigator.pushReplacementNamed(
        context,
        AppConstants.onboardingRoute,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: AppStyles.height50(context)),
            SvgPicture.asset(
              AppIcons.splashIcon,
            ),
          ],
        ),
      ),
    );
  }
}
