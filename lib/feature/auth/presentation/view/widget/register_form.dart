import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/core/widgets/custom_button.dart';
import 'package:shoppingapp/core/widgets/custom_text_form_field.dart';
import 'package:shoppingapp/feature/auth/domain/entity/register_request_entity.dart';
import 'package:shoppingapp/feature/auth/presentation/view_model/register/register_cubit.dart';
import 'package:shoppingapp/core/utils/validators.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final TextEditingController usernameController;
  late final TextEditingController phoneController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Text('Create Account', style: theme.bodyLarge),
            const SizedBox(height: 8),
            Text('Sign up to get started', style: theme.bodySmall),
            const SizedBox(height: 24),
            Text('Username', style: theme.bodyMedium),
            CustomTextFormField(
              hintText: 'username_123',
              keyboardType: TextInputType.text,
              prefixIcon: const Icon(Icons.person_outline),
              controller: usernameController,
              validator: Validators.validateName,
              hintStyle: theme.bodySmall?.copyWith(
                color: Theme.of(context).hintColor,
              ),
            ),
            const SizedBox(height: 16),
            Text('Phone Number', style: theme.bodyMedium),
            CustomTextFormField(
              hintText: '0123456789',
              keyboardType: TextInputType.phone,
              prefixIcon: const Icon(Icons.phone_outlined),
              controller: phoneController,
              validator: Validators.validatePhone,
              hintStyle: theme.bodySmall?.copyWith(
                color: Theme.of(context).hintColor,
              ),
            ),
            const SizedBox(height: 16),
            Text('Email', style: theme.bodyMedium),
            CustomTextFormField(
              hintText: 'example@email.com',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email_outlined),
              controller: emailController,
              validator: Validators.validateEmail,
              hintStyle: theme.bodySmall?.copyWith(
                color: Theme.of(context).hintColor,
              ),
            ),
            const SizedBox(height: 16),
            Text('Password', style: theme.bodyMedium),
            CustomTextFormField(
              hintText: 'Enter your password',
              isPassword: true,
              prefixIcon: const Icon(Icons.lock_outline),
              controller: passwordController,
              validator: Validators.validatePassword,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            Text('Confirm Password', style: theme.bodyMedium),
            CustomTextFormField(
              hintText: 'Enter your password again',
              isPassword: true,
              prefixIcon: const Icon(Icons.lock_outline),
              controller: confirmPasswordController,
              validator: (value) => Validators.validateConfirmPassword(
                value,
                passwordController.text,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            CustomButton(
              title: 'Sign Up',
              onPressed: () async {
                final request = RegisterRequestEntity(
                  name: usernameController.text,
                  phone: phoneController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  confirmPassword: confirmPasswordController.text,
                );
                if (formKey.currentState!.validate()) {
                  await context.read<RegisterCubit>().intent(Register(request));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
