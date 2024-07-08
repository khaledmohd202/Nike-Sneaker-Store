import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike/core/utils/colors/app_colors.dart';
import 'package:nike/core/utils/const/app_constants.dart';
import 'package:nike/features/authentication/presentation/widgets/custom_text_form_field.dart';
import 'package:nike/features/authentication/presentation/widgets/leading_icon.dart';
import 'package:nike/features/onboarding/presentation/widgets/navigation_button.dart';

class PasswordRecoveryPage extends StatelessWidget {
  const PasswordRecoveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: const LeadingIcon(),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Forgot Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                'Enter Your Email Account To Reset\n Your Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0.sp,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const CustomTextFormField(
                hintText: 'xxxxxxxx',
                keyboardType: TextInputType.emailAddress,
                horizontalPadding: 0,
                obscureText: false,
              ),
              const Spacer(flex: 10),
              NavigationButton(
                onPressed: () => _showCustomDialog(context),
                height: 48.0.h,
                width: MediaQuery.of(context).size.width,
                backgroundColor: AppColors.primaryColor,
                child: Text(
                  'Send Request',
                  style: TextStyle(
                    fontSize: 20.0.sp,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

void _showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: AppColors.blackColor.withOpacity(0.14),
    builder: (BuildContext context) {
      return Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            backgroundColor: AppColors.whiteColor,
            // shadowColor: AppColors.whiteColor,
            // surfaceTintColor: AppColors.buttonColor,
            // elevation: 0.0,
            icon: Icon(
              Icons.email,
              size: 50.sp,
              color: Colors.blue,
            ),
            iconPadding: EdgeInsets.only(top: 0.h, bottom: 10.h),
            title: Text(
              'Check your email',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            titlePadding: EdgeInsets.only(top: 0.h, bottom: 10.h),
            content: Column(
              children: [
                Text(
                  'We have sent a password recovery\n code to your email.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.borderColor.withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: NavigationButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed(
                        AppConstants.otpPageRoute,
                      );
                    },
                    height: 35.0.h,
                    width: MediaQuery.of(context).size.width * 0.4,
                    backgroundColor: AppColors.lightGreyColor,
                    child: Text(
                      'OK',
                      style: TextStyle(
                        fontSize: 20.0.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            contentPadding: EdgeInsets.only(top: 0.h, bottom: 5.h),
            insetPadding:
                EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          ),
        ),
      );
    },
  );
}
