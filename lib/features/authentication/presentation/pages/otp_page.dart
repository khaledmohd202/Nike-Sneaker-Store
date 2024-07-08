import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike/core/utils/colors/app_colors.dart';
import 'package:nike/core/utils/const/app_constants.dart';
import 'package:nike/features/authentication/presentation/widgets/leading_icon.dart';
import 'package:nike/features/onboarding/presentation/widgets/navigation_button.dart';
import 'package:pinput/pinput.dart';

class OTPPage extends StatelessWidget {
  OTPPage({super.key});
  final defaultPinTheme = PinTheme(
    width: 50.w,
    height: 48.h,
    textStyle: TextStyle(
      fontSize: 24.sp,
      color: AppColors.accentColor,
      fontWeight: FontWeight.bold,
    ),
    decoration: BoxDecoration(
      color: AppColors.primaryColor.withOpacity(0.5),
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(
        color: AppColors.primaryColor.withOpacity(0.5),
        width: 2.w,
      ),
    ),
  );

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
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                'OTP Verification',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                'Please Check Your Email We Have Sent to you a verification Code',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0.sp,
                  color: AppColors.borderColor.withOpacity(0.6),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                'OTP Code',
                style: TextStyle(
                  fontSize: 22.0.sp,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(
                      color: AppColors.accentColor,
                      width: 2.w,
                    ),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(
                      color: AppColors.errorColor,
                      width: 2.w,
                    ),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(
                      color: AppColors.successColor,
                      width: 2.w,
                    ),
                  ),
                ),
                onChanged: (String pin) {
                  // ignore: avoid_print
                  print('submit pin: $pin');
                },
                validator: (String? value) {
                  return value!.length == 6 ? null : 'Invalid OTP';
                },
              ),
              // Spacer(flex: 5),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              NavigationButton(
                onPressed: () {
                  _showCustomDialog(context);
                },
                height: 48.0.h,
                width: MediaQuery.of(context).size.width,
                backgroundColor: AppColors.primaryColor,
                child: Text(
                  'Verify',
                  style: TextStyle(
                    fontSize: 20.0.sp,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend OTP',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.accentColor.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '00:30  ',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.accentColor.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Spacer(flex: 4),
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
          height: MediaQuery.of(context).size.height * 0.25,
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
            // icon: Container(
            //   width: 50.w,
            //   height: 50.h,
            //   decoration: BoxDecoration(
            //     color: AppColors.successColor,
            //     borderRadius: BorderRadius.circular(50.r),
            //     border: Border.all(
            //       color: AppColors.successColor,
            //       width: 2.w,
            //     ),
            //   ),
            //   child: Icon(
            //     Icons.done,
            //     size: 50.sp,
            //     color: AppColors.whiteColor,
            //   ),
            // ),
            // iconPadding: EdgeInsets.only(
            //   top: 0.h,
            //   bottom: 10.h,
            //   left: 30.w,
            //   right: 30.w,
            // ),
            title: Text(
              'Done',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            titlePadding: EdgeInsets.only(top: 0.h, bottom: 10.h),
            content: Column(
              children: [
                Text(
                  'your Password has changed, go to\n explore all app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.borderColor.withOpacity(0.5),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: NavigationButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed(
                        AppConstants.homeRoute,
                      );
                    },
                    height: 35.0.h,
                    width: MediaQuery.of(context).size.width * 0.4,
                    backgroundColor: AppColors.lightGreyColor,
                    child: Text(
                      'Go',
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
