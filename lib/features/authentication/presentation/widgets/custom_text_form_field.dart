import '../../../../core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.contentPadding,
    this.keyboardType,
    this.suffixIcon,
    required this.horizontalPadding,
    this.validator,
    this.controller,
    required this.obscureText, this.formKey,
  });
  final String hintText;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final double horizontalPadding;
  final TextEditingController? controller;
  final bool obscureText;
  final Key? formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.textFormFieldColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Form(
        key: formKey,
        child: TextFormField(
          keyboardType: keyboardType,
          obscureText: obscureText,
          controller: controller,
          validator: validator,
          onTap: onTap,
          onSaved: onSaved,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: contentPadding,
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.blackColor.withOpacity(0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.r),
              ),
              borderSide: BorderSide(
                color: AppColors.secondaryColor,
                width: 2.w,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.r),
              ),
              borderSide: BorderSide(
                color: AppColors.whiteColor,
                width: 2.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15.r),
              ),
              borderSide: const BorderSide(
                // enabledBorderColor
                color: Colors.transparent,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
              borderSide: const BorderSide(color: AppColors.primaryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
              borderSide: const BorderSide(color: AppColors.errorColor),
            ),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
