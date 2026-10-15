import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/core/routes/app_routes_name.dart';
import 'package:shoppingapp/core/utils/app_dialog.dart';
import 'package:shoppingapp/feature/auth/presentation/view_model/register/register_cubit.dart';
import 'package:shoppingapp/feature/auth/presentation/view/widget/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          AppDialogs.showLoadingDialog(context);
        } else if (state is RegisterSuccess) {
          Navigator.of(context).pop();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registration successful')),
          );

          Navigator.pushNamed(context, AppRoutesName.login);
        } else if (state is RegisterError) {
          Navigator.of(context).pop();

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Sign Up')),
        body: const RegisterForm(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutesName.login);
          },
          child: Text.rich(
            TextSpan(
              text: 'Already have an account? ',
              style: Theme.of(context).textTheme.labelMedium,
              children: [
                TextSpan(
                  text: 'Sign In',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shoppingapp/core/utils/app_dialog.dart';
// import 'package:shoppingapp/core/widgets/custom_button.dart';
// import 'package:shoppingapp/core/widgets/custom_text_form_field.dart';
// import 'package:shoppingapp/core/routes/app_routes_name.dart';
// import 'package:shoppingapp/feature/auth/domain/entity/register_request_entity.dart';
// import 'package:shoppingapp/feature/auth/presentation/view_model/register/register_cubit.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<RegisterCubit, RegisterState>(
//       listener: (context, state) {
//         if (state is RegisterLoading) {
//           AppDialogs.showLoadingDialog(context);
//         } else if (state is RegisterSuccess) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Registration successful')),
//           );
//           Navigator.of(context).pop();
//           Navigator.pushNamed(context, AppRoutesName.login);
//         } else if (state is RegisterError) {
//           Navigator.of(context).pop();
//           ScaffoldMessenger.of(
//             context,
//           ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(title: const Text('Sign Up')),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//           child: Form(
//             child: Column(
//               crossAxisAlignment: .stretch,
//               children: [
//                 Text('Create Account', style: theme.bodyLarge),

//                 const SizedBox(height: 8),

//                 Text('Sign up to get started', style: theme.bodySmall),

//                 const SizedBox(height: 24),

//                 Text('Username', style: theme.bodyMedium),
//                 CustomTextFormField(
//                   hintText: 'username_123',
//                   keyboardType: TextInputType.emailAddress,
//                   prefixIcon: const Icon(Icons.email_outlined),
//                   controller: usernameController,
//                   validator: (value) {},
//                   hintStyle: theme.bodySmall?.copyWith(
//                     color: Theme.of(context).hintColor,
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 Text('Phone Number', style: theme.bodyMedium),
//                 CustomTextFormField(
//                   hintText: '0123456789',
//                   keyboardType: TextInputType.phone,
//                   prefixIcon: const Icon(Icons.phone_outlined),
//                   controller: phoneController,
//                   validator: (value) {},
//                   hintStyle: theme.bodySmall?.copyWith(
//                     color: Theme.of(context).hintColor,
//                   ),
//                 ),

//                 const SizedBox(height: 16),

//                 Text('Email', style: theme.bodyMedium),
//                 CustomTextFormField(
//                   hintText: 'example@email.com',
//                   keyboardType: TextInputType.emailAddress,
//                   prefixIcon: const Icon(Icons.email_outlined),
//                   controller: emailController,
//                   validator: (value) {},
//                   hintStyle: theme.bodySmall?.copyWith(
//                     color: Theme.of(context).hintColor,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Text('Password', style: theme.bodyMedium),

//                 CustomTextFormField(
//                   hintText: 'Enter your password',
//                   isPassword: true,
//                   prefixIcon: const Icon(Icons.lock_outline),
//                   controller: passwordController,
//                   obscureText: true,
//                 ),

//                 const SizedBox(height: 16),
//                 Text('Confirm Password', style: theme.bodyMedium),
//                 CustomTextFormField(
//                   hintText: 'Enter your password again',
//                   isPassword: true,
//                   prefixIcon: const Icon(Icons.lock_outline),
//                   controller: confirmPasswordController,
//                   obscureText: true,
//                 ),

//                 const SizedBox(height: 24),
//                 CustomButton(
//                   title: 'Sign Up',
//                   onPressed: () async{
//                     var request = RegisterRequestEntity(
//                       name: usernameController.text,
//                       phone: phoneController.text,
//                       email: emailController.text,
//                       password: passwordController.text,
//                       confirmPassword: confirmPasswordController.text,
//                     );
//                     await context.read<RegisterCubit>().intent(Register(request),);
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//         floatingActionButtonLocation:
//             FloatingActionButtonLocation.centerFloat,
//         floatingActionButton: GestureDetector(
//           onTap: () {
//             Navigator.pushNamed(context, AppRoutesName.login);
//           },
//           child: Text.rich(
//             TextSpan(
//               text: 'Already have an account? ',
//               style: theme.labelMedium,
//               children: [
//                 TextSpan(
//                   text: 'Sign In',
//                   style: theme.labelMedium?.copyWith(
//                     color: Theme.of(context).colorScheme.primary,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   late TextTheme theme;
//   late TextEditingController usernameController;
//   late TextEditingController phoneController;
//   late TextEditingController emailController;
//   late TextEditingController passwordController;
//   late TextEditingController confirmPasswordController;

//   @override
//   void initState() {
//     super.initState();
//     usernameController = TextEditingController();
//     phoneController = TextEditingController();
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//     confirmPasswordController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     usernameController.dispose();
//     phoneController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     theme = Theme.of(context).textTheme;
//   }
// }
