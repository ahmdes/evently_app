import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/core/routes/routes_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoadingDialog(BuildContext context, {String? message}) {
    showDialog(
        context: context,
        builder: (context) {
          return message == null
              ? Center(
                  child: SizedBox(
                    height: 80,
                    width: 80,
                    child: CircularProgressIndicator(
                      color: ColorsManager.light,
                    ),
                  ),
                )
              : CupertinoAlertDialog(
                  content: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.gpp_good_outlined,
                          color: Colors.green,
                          size: 40,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          message,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, RoutesManager.signIn);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.lightBlue),
                      child: Text(
                        "Ok",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ],
                );
        });
  }

  static void hideDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
