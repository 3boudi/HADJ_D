import 'package:flutter/material.dart';
import 'package:train/constants/colors.dart';
import '../../widgets/custom_text_field.dart';

class LoginFields extends StatelessWidget {
  final bool isLogin;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController phoneController;

  final bool obscurePassword;
  final VoidCallback onTogglePassword;

  final FormFieldValidator<String>? emailValidator;
  final FormFieldValidator<String>? passwordValidator;
  final FormFieldValidator<String>? phoneValidator;
  final FormFieldValidator<String>? nameValidator; // ✅ إضافة للاسم

  const LoginFields({
    super.key,
    required this.isLogin,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.phoneController,
    required this.obscurePassword,
    required this.onTogglePassword,
    this.emailValidator,
    this.passwordValidator,
    this.phoneValidator,
    this.nameValidator, // ✅ إضافة للاسم
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ========== تسجيل الدخول (رقم الهاتف + كلمة مرور) ==========
        if (isLogin) ...[
          CustomTextField(
            controller: phoneController,
            label: 'رقم الهاتف',
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
            validator: phoneValidator, // ✅ مطلوب في تسجيل الدخول
          ),
          const SizedBox(height: 20),

          CustomTextField(
            controller: passwordController,
            label: 'كلمة المرور',
            icon: Icons.lock_outline,
            obscureText: obscurePassword,
            validator: passwordValidator,
            suffixIcon: IconButton(
              icon: Icon(
                obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: AppColors.textSecondary,
              ),
              onPressed: onTogglePassword,
            ),
          ),
        ],

        // ========== إنشاء حساب (الاسم + رقم الهاتف + إيميل + كلمة مرور) ==========
        if (!isLogin) ...[
          CustomTextField(
            controller: nameController,
            label: 'الاسم الكامل',
            icon: Icons.person_outline,
            validator: nameValidator, // ✅ إضافة validator للاسم
          ),
          const SizedBox(height: 20),

          CustomTextField(
            controller: phoneController,
            label: 'رقم الهاتف',
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
            validator: phoneValidator,
          ),
          const SizedBox(height: 20),

          CustomTextField(
            controller: emailController,
            label: 'البريد الإلكتروني',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            validator: emailValidator,
          ),
          const SizedBox(height: 20),

          CustomTextField(
            controller: passwordController,
            label: 'كلمة المرور',
            icon: Icons.lock_outline,
            obscureText: obscurePassword,
            validator: passwordValidator,
            suffixIcon: IconButton(
              icon: Icon(
                obscurePassword ? Icons.visibility_off : Icons.visibility,
                color: AppColors.textSecondary,
              ),
              onPressed: onTogglePassword,
            ),
          ),
        ],
      ],
    );
  }
}
