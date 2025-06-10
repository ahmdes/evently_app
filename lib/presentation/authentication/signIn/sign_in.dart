import 'package:evently_project/core/resources/assets_manager.dart';
import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/core/routes/routes_manager.dart';
import 'package:evently_project/presentation/components/build_text_fields.dart';
import 'package:evently_project/presentation/models/text_field_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/buildElevatedButton.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obsecure = true;
  IconData iconData = Icons.remove_red_eye_sharp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.only(
          top: 80,
          right: 16,
          left: 16,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 150.h,
              width: 150.w,
              child: Image.asset(
                AssetsManager.eventlyLogo,
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 163.h,
              width: 361.w,
              child: Column(
                children: [
                  BuildTextFields(
                    textFieldDM: TextFieldDM(
                      prefixIcon: Icon(
                        Icons.email_rounded,
                      ),
                      suffixIcon: null,
                      hintText: "Email",
                      obsecureText: false,
                      heightOfTextField: null,
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  BuildTextFields(
                    textFieldDM: TextFieldDM(
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (iconData == Icons.remove_red_eye_sharp) {
                            iconData = Icons.visibility_off;
                            obsecure = false;
                          } else if (iconData == Icons.visibility_off) {
                            iconData = Icons.remove_red_eye_sharp;
                            obsecure = true;
                          }
                          setState(() {});
                        },
                        icon: Icon(
                          iconData,
                        ),
                      ),
                      hintText: "Password",
                      obsecureText: obsecure,
                      heightOfTextField: null,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, RoutesManager.resetPassword);
                      },
                      child: Text(
                        "Forget Password?",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              height: 223.h,
              width: 361.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BuildElevatedButton(
                    
                    nameOfButton: 'Login',
                    onClicked: () {
                      Navigator.pushNamed(context, RoutesManager.mainLayout);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have Account ? ",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesManager.signUp);
                        },
                        child: Text(
                          "Create Account",
                            style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 129.w,
                        child: Divider(
                          color: ColorsManager.blue,
                          thickness: 1,
                        ),
                      ),
                      Text(
                        "Or",
                        style: Theme.of(context).textTheme.displaySmall,

                      ),
                      SizedBox(
                        width: 129.w,
                        child: Divider(
                          color: ColorsManager.blue,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(361.w, 57.h),
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        side: BorderSide(
                          color: ColorsManager.blue,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 26.h,
                          width: 26.w,
                          child: Image.asset(AssetsManager.googleLogo),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Login With Google",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 30.h,
              width: 73.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: ColorsManager.blue,
                    width: 2,
                  )),
              child: Row(
                children: [
                  Image.asset(AssetsManager.america),
                  Spacer(),
                  Image.asset(AssetsManager.egypt),
                ],
              ),
            ),
            Spacer(
              flex: 10,
            ),
          ],
        ),
      ),
    );
  }
}
