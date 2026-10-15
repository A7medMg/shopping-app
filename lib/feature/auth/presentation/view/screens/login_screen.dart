import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/core/routes/app_routes_name.dart';
import 'package:shoppingapp/core/utils/app_dialog.dart';
import 'package:shoppingapp/feature/auth/presentation/view_model/login/login_cubit.dart';
import 'package:shoppingapp/feature/auth/presentation/view/widget/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          AppDialogs.showLoadingDialog(context);
        } else if (state is LoginSuccess) {
          Navigator.of(context).pop();

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Login successful')));

          Navigator.pushNamed(context, AppRoutesName.onBoarding);
        } else if (state is LoginError) {
          Navigator.of(context).pop();

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Sign In')),
        body: const LoginForm(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutesName.register);
          },
          child: Text.rich(
            TextSpan(
              text: "Don't have an account? ",
              style: Theme.of(context).textTheme.labelMedium,
              children: [
                TextSpan(
                  text: 'Sign Up',
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
// import 'package:shoppingapp/feature/auth/presentation/view_model/login/login_cubit.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<LoginCubit, LoginState>(
//       listener: (context, state) {
//         if (state is LoginLoading) {
//           AppDialogs.showLoadingDialog(context);
//         } else if (state is LoginSuccess) {
//           ScaffoldMessenger.of(
//             context,
//           ).showSnackBar(const SnackBar(content: Text('Login successful')));
//           Navigator.of(context).pop();
//           Navigator.pushNamed(context, AppRoutesName.onBoarding);
//         } else if (state is LoginError) {
//           Navigator.of(context).pop();
//           ScaffoldMessenger.of(
//             context,
//           ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(title: const Text('Sign In')),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//           child: Form(
//             child: Column(
//               crossAxisAlignment: .stretch,
//               children: [
//                 Text('Sign In', style: theme.bodyLarge),

//                 const SizedBox(height: 8),

//                 Text('Sign in to continue', style: theme.bodySmall),

//                 const SizedBox(height: 24),

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

//                 const SizedBox(height: 24),
//                 CustomButton(
//                   title: 'Sign In',
//                   onPressed: () async {
//                     await context.read<LoginCubit>().intent(
//                       LoginWithEmailPassword(
//                         emailController.text,
//                         passwordController.text,
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//         floatingActionButtonLocation: .centerFloat,
//         floatingActionButton: GestureDetector(
//           onTap: () {
//             Navigator.pushNamed(context, AppRoutesName.register);
//           },
//           child: Text.rich(
//             TextSpan(
//               text: 'Don\'t have an account? ',
//               style: theme.labelMedium,
//               children: [
//                 TextSpan(
//                   text: 'Sign Up',
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
//   late TextEditingController emailController;
//   late TextEditingController passwordController;
//   @override
//   void initState() {
//     super.initState();
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   didChangeDependencies() {
//     super.didChangeDependencies();
//     theme = Theme.of(context).textTheme;
//   }
// }
