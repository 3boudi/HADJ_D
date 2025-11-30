class OnboardingModel {
  final String title;
  final String description;
  final String? image;
  final String? networkImage;

  OnboardingModel({
    required this.title,
    required this.description,
    this.image,
    this.networkImage,
  });
}
