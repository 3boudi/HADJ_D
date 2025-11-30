import 'package:flutter/material.dart';
import 'package:train/constants/colors.dart';
import '../../models/onboarding_model.dart';
import 'package:train/login/screens/login/login_page.dart';
import 'onboarding_content.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  final List<OnboardingModel> pages = [
    OnboardingModel(
      title: 'مرحبا بك',
      description: 'افضل خدمة توصيل في قايس حاج ديلفري',
      image: 'assets/images/H2.png',
    ),
    OnboardingModel(
      title: 'اربح الوقت',
      description: 'من خلال خدمتنا السريعة والموثوقة.',
      networkImage: "assets/lottie/Clock_loop.json",
    ),
    OnboardingModel(
      title: 'نوفر افضل العروض',
      description: 'استفد من خصوماتنا الحصرية ',
      networkImage: "assets/lottie/Offer.json",
    ),
    OnboardingModel(
      title: 'خدمة احترافية',
      description: 'من فريقنا المدرب لتلبية احتياجاتك.',
      networkImage: "assets/lottie/Deliveryguy.json",
    ),

    OnboardingModel(
      title: 'ابدأ الآن',
      description: 'انضم إلينا وابدأ رحلتك اليوم.',
      image: 'assets/images/H2.png',
    ),
  ];

  void _completeOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: OnboardingContent(
        pageController: _pageController,
        pages: pages,
        currentPage: _currentPage,
        onPageChanged: (idx) => setState(() => _currentPage = idx),
        onComplete: _completeOnboarding,
      ),
    );
  }
}
