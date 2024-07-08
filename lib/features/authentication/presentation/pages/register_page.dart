import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike/core/utils/assets/app_icons.dart';
import 'package:nike/core/utils/colors/app_colors.dart';
import 'package:nike/core/utils/const/app_constants.dart';
import 'package:nike/core/utils/const/app_styles.dart';
import 'package:nike/features/authentication/presentation/widgets/custom_text_form_field.dart';
import 'package:nike/features/authentication/presentation/widgets/leading_icon.dart';
import 'package:nike/features/onboarding/presentation/widgets/navigation_button.dart';
import 'package:svg_flutter/svg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _submitForm() {
    final emailFormState = _emailKey.currentState;
    final passwordFormState = _passwordKey.currentState;

    if (emailFormState != null && passwordFormState != null) {
      if (emailFormState.validate() && passwordFormState.validate()) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Processing Data')));
      }
    }
  }

  void _togglePasswordView() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        leading: const LeadingIcon(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'Register Account',
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
              height: AppStyles.height50(context),
            ),
            registerBody(context),
          ],
        ),
      ),
    );
  }

  Padding registerBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headlineText(title: 'Your Name'),
          SizedBox(
            height: AppStyles.height10(context),
          ),
          const CustomTextFormField(
            obscureText: false,
            hintText: 'Your Name',
            horizontalPadding: 0,
          ),
          SizedBox(
            height: AppStyles.height20(context),
          ),
          headlineText(title: 'Email Address'),
          SizedBox(
            height: AppStyles.height10(context),
          ),
          CustomTextFormField(
            formKey: _emailKey,
            obscureText: false,
            hintText: 'Email Address',
            horizontalPadding: 0,
            controller: _emailController,
            validator: _validateEmail,
          ),
          SizedBox(height: AppStyles.height20(context)),
          headlineText(title: 'Password'),
          SizedBox(height: AppStyles.height10(context)),
          CustomTextFormField(
            formKey: _passwordKey,
            obscureText: _obscureText,
            controller: _passwordController,
            validator: _validatePassword,
            hintText: 'Password',
            horizontalPadding: 0,
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                size: 18.sp,
                color: AppColors.blackColor.withOpacity(0.5),
              ),
              onPressed: _togglePasswordView,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Text(
          //       AppStrings.passwordRecoveryString,
          //       style: TextStyle(
          //         color: AppColors.accentColor.withOpacity(0.7),
          //         fontWeight: FontWeight.bold,
          //         fontSize: 11.sp,
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: AppStyles.height30(context),
          ),
          NavigationButton(
            height: AppStyles.height50(context) * 1.2,
            width: MediaQuery.of(context).size.width * 0.9,
            backgroundColor: AppColors.primaryColor,
            onPressed: () {
              _submitForm();
              Navigator.pushReplacementNamed(context, AppConstants.homeRoute);
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: AppStyles.height20(context)),
          NavigationButton(
            height: AppStyles.height50(context) * 1.2,
            width: MediaQuery.of(context).size.width * 0.9,
            backgroundColor: AppColors.textFormFieldColor,
            onPressed: () {
              // Navigator.pushNamed(context, AppConstants.homeRoute);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppIcons.googleIcon,
                  height: 20.sp,
                  width: 20.sp,
                ),
                SizedBox(width: AppStyles.width20(context)),
                Text(
                  'Sign In with Google',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppStyles.height50(context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: TextStyle(
                  color: AppColors.accentColor.withOpacity(0.7),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget headlineText({required String title}) {
  return Padding(
    padding: EdgeInsets.only(
      left: 5.w,
      top: 5.h,
    ),
    child: Text(
      title,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: AppColors.blackColor.withOpacity(0.7),
        fontWeight: FontWeight.w600,
        fontSize: 15.sp,
      ),
    ),
  );
}
