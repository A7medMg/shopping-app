import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/core/widgets/custom_button.dart';
import 'package:shoppingapp/core/widgets/custom_text_form_field.dart';
import 'package:shoppingapp/feature/auth/presentation/view_model/login/login_cubit.dart';
import 'package:shoppingapp/core/utils/validators.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
            Text('Sign In', style: theme.bodyLarge),
            const SizedBox(height: 8),
            Text('Sign in to continue', style: theme.bodySmall),
            const SizedBox(height: 24),
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
              obscureText: true,
            ),
            const SizedBox(height: 24),
            CustomButton(
              title: 'Sign In',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await context.read<LoginCubit>().intent(
                    LoginWithEmailPassword(
                      emailController.text,
                      passwordController.text,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
