import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike/core/utils/colors/app_colors.dart';

class LeadingIcon extends StatelessWidget {
  const LeadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 50.w,
      margin: EdgeInsets.only(left: 20.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 20.sp,
        ),
      ),
    );
  }
}
