import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_project/core/extensions/button_text_validation.dart';
import 'package:evently_project/core/extensions/authentication_validation.dart';
import 'package:evently_project/firebase_service/firebase_service.dart';
import 'package:evently_project/presentation/components/buildElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../Provider/config_provider.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/routes/routes_manager.dart';
import '../../components/build_text_fields.dart';
import '../../models/text_field_dm.dart';

enum CountryOption { egypt, america }

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  CountryOption selectedCountry = CountryOption.america;
  IconData iconData = Icons.remove_red_eye_sharp;
  late ConfigProvider provider;
  @override
  bool obsecureOfPassword = true;
  IconData iconDataOfPassword = Icons.remove_red_eye_sharp;
  bool obsecureOfRePassword = true;
  IconData iconDataOfRePassword = Icons.remove_red_eye_sharp;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ConfigProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register),
      ),
      body: Form(
        key: formKey,
        child: Padding(
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
                          controller: nameController,
                          suffixIcon: null,
                          hintText: AppLocalizations.of(context)!.name,
                          obsecureText: false,
                          heightOfTextField: null,
                          validate: (String? input) {
                            if (!ButtonTextValidation.isValidateString(input)) {
                              return AppLocalizations.of(context)!.enter_your_name;
                            }
                            return null;
                          }),
                    ),
                    Spacer(
                      flex: 2,
                    ),
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
                    Spacer(
                      flex: 2,
                    ),
                    BuildTextFields(
                      textFieldDM: TextFieldDM(
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          controller: passwordController,
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
                          hintText: AppLocalizations.of(context)!.password,
                          obsecureText: obsecureOfPassword,
                          heightOfTextField: null,
                          validate: (String? password) {
                            if (!password!.isValidPassword()) {
                              return AppLocalizations.of(context)!.enter_valid_password;
                            }
                            return null;
                          }),
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
                                iconDataOfRePassword =
                                    Icons.remove_red_eye_sharp;
                                obsecureOfRePassword = true;
                              }
                              setState(() {});
                            },
                            icon: Icon(
                              iconDataOfRePassword,
                            ),
                          ),
                          controller: rePasswordController,
                          hintText: AppLocalizations.of(context)!.re_password,
                          obsecureText: obsecureOfRePassword,
                          heightOfTextField: null,
                          validate: (String? rePassword) {
                            if (!(rePassword == passwordController.text &&
                                rePassword != null)) {
                              return AppLocalizations.of(context)!.password_matching;
                            }
                            return null;
                          }),
                    ),
                    Spacer(
                      flex: 4,
                    ),
                    BuildElevatedButton(
                      nameOfButton:
                          AppLocalizations.of(context)!.create_account,
                      onClicked: _signUp,
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.already_have_account,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesManager.signIn);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.login,
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
              Spacer(
                flex: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    if (!formKey.currentState!.validate()) return;
    await FirebaseService.signUp(
        emailController.text, passwordController.text, context,nameController.text);
  }
}
