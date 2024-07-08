import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike/config/routes/app_routes.dart';
// import 'package:nike/core/utils/colors/app_colors.dart';

class NikeApp extends StatelessWidget {
  const NikeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: ThemeData(
          // primarySwatch: Colors.white,
          // primaryColor: AppColors.whiteColor
        ),
      ),
    );
  }
}
