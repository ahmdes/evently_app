import 'package:evently_project/core/resources/assets_manager.dart';
import 'package:evently_project/presentation/components/buildElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.forget_password,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: SizedBox(
          width: 361,
          height: 441,
          child: Column(
            children: [
              Image.asset(
                AssetsManager.resetPassword,
              ),
              Spacer(),
              BuildElevatedButton(
                nameOfButton: AppLocalizations.of(context)!.reset_password,
                onClicked: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
