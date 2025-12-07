import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import 'login_fields.dart';
import 'login_buttons.dart';
import 'login_toggle.dart';
import '/splash/splash_screen.dart';
import 'package:arabic_font/arabic_font.dart';
import 'package:train/login/validators.dart';
import 'phone_confirmation_dialog.dart';

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
  final _phoneController = TextEditingController();

  bool _obscurePassword = true;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // إذا كان في وضع إنشاء حساب (!isLogin) نعرض dialog تأكيد رقم الهاتف
      if (!widget.isLogin) {
        _showPhoneConfirmationDialog();
      } else {
        // إذا كان في وضع تسجيل الدخول، ندخل مباشرة
        _navigateToSplash();
      }
    }
  }

  void _showPhoneConfirmationDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5), // خلفية شبه شفافة
      builder: (context) => PhoneConfirmationDialog(
        phoneNumber: _phoneController.text,
        onConfirm: () {
          Navigator.of(context).pop(); // لإغلاق الـ dialog
          _navigateToSplash();
        },
        onCancel: () {
          Navigator.of(context).pop(); // لإغلاق الـ dialog
        },
      ),
    );
  }

  void _navigateToSplash() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SplashScreen(isAfterLogin: true),
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (widget.isLogin) return null; // الإيميل غير مطلوب في تسجيل الدخول
    final result = validateEmail(value);
    return result?.data;
  }

  String? _validatePassword(bool isLogin, String? value) {
    final result = validatePassword(isLogin, value);
    return result?.data; // ✅ تحويل Text? إلى String?
  }

  String? _validatePhone(bool isLogin, String? value) {
    final result = validatePhone(isLogin, value);
    return result?.data;
  }

  String? _validateName(String? value) {
    if (widget.isLogin) return null; // الاسم غير مطلوب في تسجيل الدخول
    final result = validateName(value);
    return result?.data; // ✅ تحويل Text? إلى String?
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 440),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.background,
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
              child: Image.asset(
                'assets/images/H_logo.png',
                width: 30,
                height: 30,
              ),
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
              widget.isLogin ? 'سجل الدخول برقم هاتفك' : 'سجل لتبدأ رحلتك',
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
              phoneController: _phoneController,
              obscurePassword: _obscurePassword,
              onTogglePassword: () =>
                  setState(() => _obscurePassword = !_obscurePassword),
              emailValidator: _validateEmail,
              passwordValidator: (value) =>
                  _validatePassword(widget.isLogin, value),
              phoneValidator: (value) => _validatePhone(widget.isLogin, value),
              nameValidator: _validateName, // ✅ إضافة validator للاسم
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
