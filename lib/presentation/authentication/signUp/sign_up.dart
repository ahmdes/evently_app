import 'package:evently_project/presentation/components/buildElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/routes/routes_manager.dart';
import '../../components/build_text_fields.dart';
import '../../models/text_field_dm.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool obsecureOfPassword = true;
  IconData iconDataOfPassword = Icons.remove_red_eye_sharp;
  bool obsecureOfRePassword = true;
  IconData iconDataOfRePassword = Icons.remove_red_eye_sharp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: REdgeInsets.only(
          top: 30,
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
              height: 379.h,
              width: 361.w,
              child: Column(
                children: [
                  BuildTextFields(
                    textFieldDM: TextFieldDM(
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      suffixIcon: null,
                      hintText: "Name",
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
                          if (iconDataOfPassword ==
                              Icons.remove_red_eye_sharp) {
                            iconDataOfPassword = Icons.visibility_off;
                            obsecureOfPassword = false;
                          } else if (iconDataOfPassword ==
                              Icons.visibility_off) {
                            iconDataOfPassword = Icons.remove_red_eye_sharp;
                            obsecureOfPassword = true;
                          }
                          setState(() {});
                        },
                        icon: Icon(
                          iconDataOfPassword,
                        ),
                      ),
                      hintText: "Password",
                      obsecureText: obsecureOfPassword,
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
                          if (iconDataOfRePassword ==
                              Icons.remove_red_eye_sharp) {
                            iconDataOfRePassword = Icons.visibility_off;
                            obsecureOfRePassword = false;
                          } else if (iconDataOfRePassword ==
                              Icons.visibility_off) {
                            iconDataOfRePassword = Icons.remove_red_eye_sharp;
                            obsecureOfRePassword = true;
                          }
                          setState(() {});
                        },
                        icon: Icon(
                          iconDataOfRePassword,
                        ),
                      ),
                      hintText: "Re Password",
                      obsecureText: obsecureOfRePassword,
                      heightOfTextField: null,
                    ),
                  ),
                  Spacer(
                    flex: 4,
                  ),
                  BuildElevatedButton(
                    nameOfButton: "Create Account",
                    onClicked: () {},
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Have Account ? ",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesManager.signIn);
                        },
                        child: Text(
                          "Login",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
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
                    width: 2.w,
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
