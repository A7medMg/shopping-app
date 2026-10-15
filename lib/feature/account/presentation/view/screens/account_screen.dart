import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppingapp/feature/account/presentation/view/widget/edit_user_bloc_listener.dart';
import 'package:shoppingapp/feature/account/presentation/view/widget/upload_image_bloc_listener.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:shoppingapp/core/helper/spacing_helper.dart';
import 'package:shoppingapp/core/widgets/custom_button.dart';
import 'package:shoppingapp/core/widgets/custom_text_form_field.dart';
import 'package:shoppingapp/feature/account/presentation/view/widget/account_image.dart';
import 'package:shoppingapp/feature/account/presentation/view_model/account_cubit.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late TextEditingController name;
  late TextEditingController address;
  late TextEditingController phone;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<AccountCubit>().getUserData();
    name = TextEditingController();
    address = TextEditingController();
    phone = TextEditingController();
  }

  @override
  void dispose() {
    name.dispose();
    address.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocBuilder<AccountCubit, AccountState>(
          buildWhen: (previous, current) =>
              current is AccountSuccess ||
              current is AccountError ||
              current is AccountLoading,
          builder: (context, state) {
            if (state is AccountError) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      state.message,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () =>
                          context.read<AccountCubit>().getUserData(),
                      child: const Text('إعادة المحاولة'),
                    ),
                  ],
                ),
              );
            }
            if (state is AccountSuccess) {
              _setControllerValue(name, state.userEntity.name);
              _setControllerValue(address, state.userEntity.address);
              _setControllerValue(phone, state.userEntity.phone);

              return Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpacing(105),
                      Align(
                        alignment: AlignmentGeometry.center,
                        child: AccountImage(
                          image: state.userEntity.image.isNotEmpty
                              ? state.userEntity.image
                              : imageacc,
                        ),
                      ),
                      Text(
                        "Name",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      CustomTextFormField(
                        controller: name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      Text(
                        "Address",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      CustomTextFormField(
                        controller: address,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                      ),
                      Text(
                        "Phone",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      CustomTextFormField(
                        controller: phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),
                      verticalSpacing(50),
                      CustomButton(
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.onSecondary,
                        title: 'Submit',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final hasTextChanges =
                                name.text.trim() !=
                                    state.userEntity.name.trim() ||
                                address.text.trim() !=
                                    state.userEntity.address.trim() ||
                                phone.text.trim() !=
                                    state.userEntity.phone.trim();
                            final hasImageChange =
                                context.read<AccountCubit>().imagepath != null;

                            if (!hasTextChanges && !hasImageChange) return;

                            if (hasImageChange) {
                              context.read<AccountCubit>().uploadImage();
                            }
                            context.read<AccountCubit>().updateUserData(
                              name: name.text,
                              address: address.text,
                              phone: phone.text,
                              image: state.userEntity.image,
                            );
                          }
                        },
                      ),
                      verticalSpacing(50),
                      EditUserBlocListener(),

                      UploadImageBlocListener(),
                    ],
                  ),
                ),
              );
            }
            return Skeletonizer(
              enabled: true,
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing(105),
                  Align(
                    alignment: AlignmentGeometry.center,
                    child: AccountImage(image: imageacc),
                  ),
                  Text("Name", style: Theme.of(context).textTheme.bodyMedium),
                  CustomTextFormField(controller: name),
                  Text(
                    "Address",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  CustomTextFormField(controller: address),
                  Text("Phone", style: Theme.of(context).textTheme.bodyMedium),
                  CustomTextFormField(controller: phone),
                  CustomButton(
                    backgroundColor: Theme.of(context).colorScheme.onSecondary,
                    title: 'Submit',
                    onPressed: () {},
                  ),
                  verticalSpacing(50),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

void _setControllerValue(TextEditingController controller, String value) {
  if (controller.text != value) {
    controller.value = TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );
  }
}

String imageacc =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOnXqFMMMR6i62lFezO1d1zvu0pjWoJurVwWa0-0Xp6TZy5MbEd9mSVDos&s=10";
