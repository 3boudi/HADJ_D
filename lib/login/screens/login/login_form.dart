import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'login_fields.dart';
import 'login_buttons.dart';
import 'login_toggle.dart';
import '/splash/splash_screen.dart';
import 'package:arabic_font/arabic_font.dart';

class LoginForm extends StatefulWidget {
  final bool isLogin;
  final VoidCallback onToggleMode;

  const LoginForm({
    super.key,
    required this.isLogin,
    required this.onToggleMode,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  bool _obscurePassword = true;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_isValidLogin()) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const SplashScreen(isAfterLogin: true),
          ),
        );
      }
    }
  }

  bool _isValidLogin() {
    final email = _emailController.text;
    final emailValid = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(email);

    final password = _passwordController.text;
    final passwordValid = password.length >= 6;

    if (!widget.isLogin) {
      final name = _nameController.text;
      final nameValid = name.length >= 2;
      return emailValid && passwordValid && nameValid;
    }

    return emailValid && passwordValid;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 440),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.person, color: Colors.white, size: 36),
            ),
            const SizedBox(height: 24),
            Text(
              widget.isLogin ? 'مرحباً بعودتك' : 'إنشاء حساب',
              style: ArabicTextStyle(
                arabicFont: ArabicFont.dinNextLTArabic,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.isLogin ? 'سجل الدخول للمتابعة' : 'سجل لتبدأ رحلتك',
              style: ArabicTextStyle(
                arabicFont: ArabicFont.dinNextLTArabic,
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 40),
            LoginFields(
              isLogin: widget.isLogin,
              emailController: _emailController,
              passwordController: _passwordController,
              nameController: _nameController,
              obscurePassword: _obscurePassword,
              onTogglePassword: () =>
                  setState(() => _obscurePassword = !_obscurePassword),
            ),
            const SizedBox(height: 32),
            LoginButtons(isLogin: widget.isLogin, onSubmit: _submit),
            const SizedBox(height: 20),
            LoginToggle(
              isLogin: widget.isLogin,
              onToggleMode: widget.onToggleMode,
            ),
          ],
        ),
      ),
    );
  }
}
