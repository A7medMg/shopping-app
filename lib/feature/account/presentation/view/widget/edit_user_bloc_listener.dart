import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/feature/account/presentation/view_model/account_cubit.dart';

class EditUserBlocListener extends StatelessWidget {
  const EditUserBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountCubit, AccountState>(
      listenWhen: (previous, current) =>
          current is AccountEditUserDataSuccess ||
          current is AccountEditUserDataError ||
          current is AccountEditUserDataLoading,
      listener: (context, state) {
        if (state is AccountEditUserDataSuccess) {
          context.read<AccountCubit>().getUserData();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User data updated successfully'),
              backgroundColor: Colors.green,
            ),
          );
        }
        if (state is AccountEditUserDataError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
