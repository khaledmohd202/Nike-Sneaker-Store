import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.height,
    required this.width,
    required this.onPressed,
    required this.child, this.backgroundColor,
  });

  final double? height;
  final double? width;
  final Color? backgroundColor;
  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: child,
      ),
    );
  }
}
