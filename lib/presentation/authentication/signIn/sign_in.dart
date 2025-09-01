import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_project/Provider/config_provider.dart';
import 'package:evently_project/core/extensions/authentication_validation.dart';
import 'package:evently_project/core/resources/assets_manager.dart';
import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/core/routes/routes_manager.dart';
import 'package:evently_project/firebase_service/firebase_service.dart';
import 'package:evently_project/presentation/components/build_text_fields.dart';
import 'package:evently_project/presentation/models/text_field_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../components/buildElevatedButton.dart';

enum CountryOption { egypt, america }

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obsecure = true;
  CountryOption selectedCountry = CountryOption.america;
  IconData iconData = Icons.remove_red_eye_sharp;
  late ConfigProvider provider;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ConfigProvider>(context);
    // void navigate() async {
    //   if (provider.newUser != null) {
    //     provider.newUser = await FirebaseService.getUserFromFireStore(
    //         FirebaseAuth.instance.currentUser!.uid);
    //     Navigator.pushNamed(context, RoutesManager.mainLayout);
    //   }
    // }

    // navigate();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
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
                            controller: emailController,
                            suffixIcon: null,
                            hintText: AppLocalizations.of(context)!.email,
                            obsecureText: false,
                            heightOfTextField: null,
                            validate: (String? email) {
                              if (!email!.isValidEmail()) {
                                return "Please enter a valid email";
                              }
                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      BuildTextFields(
                        textFieldDM: TextFieldDM(
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                            controller: passwordController,
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
                            hintText: AppLocalizations.of(context)!.password,
                            obsecureText: obsecure,
                            heightOfTextField: null,
                            validate: (String? password) {
                              if (!password!.isValidPassword()) {
                                return "please , enter valid password";
                              }
                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesManager.resetPassword);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.forget_password,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 223.h,
                  width: 361.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BuildElevatedButton(
                        nameOfButton: AppLocalizations.of(context)!.login,
                        onClicked: _logIn,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.do_not_have_account,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RoutesManager.signUp);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.create_account,
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
                            AppLocalizations.of(context)!.or,
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
                        onPressed: _logInWithGoogle,
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
                              AppLocalizations.of(context)!.login_with_google,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 40.h,
                  width: 75.w,
                  child: AnimatedToggleSwitch<CountryOption>.dual(
                    current: selectedCountry,
                    first: CountryOption.egypt,
                    second: CountryOption.america,
                    onChanged: (value) {
                      if (value == CountryOption.egypt) {
                        provider.configLanguage(Locale("ar"));
                        selectedCountry = CountryOption.egypt;
                      } else {
                        provider.configLanguage(Locale("en"));
                        selectedCountry = CountryOption.america;
                      }
                    },
                    iconBuilder: (value) => Image.asset(
                      value == CountryOption.egypt
                          ? AssetsManager.egypt
                          : AssetsManager.america,
                      width: 24.w,
                      height: 24.h,
                    ),
                    style: ToggleStyle(
                      indicatorColor: ColorsManager.blue,
                      borderColor: ColorsManager.blue,
                      borderRadius: BorderRadius.circular(30.r),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _logIn() async {
    if (!formKey.currentState!.validate()) return;
    await FirebaseService.signIn(
        emailController.text, passwordController.text, context);
  }

  void _logInWithGoogle() async {

    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     backgroundColor: ColorsManager.grey,
    //     content: Text(
    //       "Waiting ...",
    //       style: Theme.of(context).textTheme.displayMedium,
    //     ),
    //   ),
    // );

    await FirebaseService.signInWithGoogle(context);
  }
}
