import 'package:nike/core/utils/assets/app_icons.dart';

class Onboarding {
  final String? title;
  final String? description;
  final String image;

  Onboarding({
    this.title,
    this.description,
    required this.image,
  });
}

final List<Onboarding> onboardingData = [
  Onboarding(
    image: AppIcons.onboarding_1Icon,
  ),
  Onboarding(
    image: AppIcons.onboarding_2Icon,
  ),
  Onboarding(
    image: AppIcons.onboarding_3Icon,
  ),
];

final shoesImage = [
  AppIcons.shoes_1Icon,
  AppIcons.shoes_2Icon,
  AppIcons.shoes_3Icon,
];
