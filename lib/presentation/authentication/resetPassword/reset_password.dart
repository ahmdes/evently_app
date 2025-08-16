import 'package:evently_project/core/extensions/authentication_validation.dart';
import 'package:evently_project/core/resources/assets_manager.dart';
import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/firebase_service/firebase_service.dart';
import 'package:evently_project/presentation/components/buildElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/build_text_fields.dart';
import '../../models/text_field_dm.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.forget_password,
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: REdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SizedBox(
            width: 361.w,
            height: 541.h,
            child: Column(
              children: [
                Image.asset(
                  AssetsManager.resetPassword,
                ),
                Spacer(),
                BuildTextFields(
                  textFieldDM: TextFieldDM(
                      prefixIcon: Icon(
                        Icons.email_rounded,
                      ),
                      controller: emailController,
                      suffixIcon: null,
                      hintText: AppLocalizations.of(context)!.email,
                      obsecureText: false,
                      heightOfTextField: null,
                      validate: (String? email) {
                        if (!email!.isValidEmail()) {
                          return AppLocalizations.of(context)!.enter_valid_email;
                        }
                        return null;
                      }),
                ),
                Spacer(),
                BuildElevatedButton(
                  nameOfButton: AppLocalizations.of(context)!.reset_password,
                  onClicked: () {
                    if (!formKey.currentState!.validate()) return;
                    FirebaseService.resetPassword(emailController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          AppLocalizations.of(context)!.reset_done,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        backgroundColor: ColorsManager.grey,
                      ),
                    );

                     Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
