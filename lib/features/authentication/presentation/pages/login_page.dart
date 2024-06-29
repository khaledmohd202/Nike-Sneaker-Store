import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike/core/utils/colors/app_colors.dart';
import 'package:nike/core/utils/const/app_constants.dart';
import 'package:nike/core/utils/const/app_styles.dart';
import 'package:nike/features/authentication/presentation/widgets/leading_icon.dart';
import 'package:nike/features/onboarding/presentation/widgets/navigation_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: const LeadingIcon(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: AppStyles.height10(context),
          ),
          Center(
            child: Text(
              'Hello Again',
              style: TextStyle(
                color: AppColors.secondaryColor,
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: AppStyles.height10(context),
          ),
          Center(
            child: Text(
              'Fill your details or continue with\n social media',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.accentColor.withOpacity(0.7),
                fontSize: 16.sp,
              ),
            ),
          ),
          SizedBox(
            height: AppStyles.height10(context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: AppColors.accentColor.withOpacity(0.7),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppStyles.height10(context),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: AppColors.accentColor.withOpacity(0.7),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppStyles.height10(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.accentColor.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppStyles.height10(context),
                ),
                NavigationButton(
                  height: AppStyles.height50(context) * 1.2,
                  width: MediaQuery.of(context).size.width * 0.9,
                  backgroundColor: AppColors.secondaryColor,
                  onPressed: () {
                    Navigator.pushNamed(context, AppConstants.homeRoute);
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: AppColors.accentColor.withOpacity(0.7),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, AppConstants.registerRoute);
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
