import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/feature/account/presentation/view_model/account_cubit.dart';

class UploadImageBlocListener extends StatelessWidget {
  const UploadImageBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountCubit, AccountState>(
      listenWhen: (previous, current) =>
          current is AccountImageUploadSuccess ||
          current is AccountImageUploadError ||
          current is AccountImageUploadLoading,
      listener: (context, state) {
        if (state is AccountImageUploadSuccess) {
          context.read<AccountCubit>().getUserData();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Image uploaded successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
        if (state is AccountImageUploadError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
