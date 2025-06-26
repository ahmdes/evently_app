import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently_project/Provider/config_provider.dart';
import 'package:evently_project/core/resources/assets_manager.dart';
import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/core/routes/routes_manager.dart';
import 'package:evently_project/presentation/components/build_text_fields.dart';
import 'package:evently_project/presentation/models/text_field_dm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../components/buildElevatedButton.dart';
import '../../on_boarding/on_boarding.dart';
enum CountryOption { egypt, america }

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool obsecure = true;
  CountryOption selectedCountry = CountryOption.egypt;
  IconData iconData = Icons.remove_red_eye_sharp;
  late ConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider =Provider.of<ConfigProvider>(context);
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
                      hintText:AppLocalizations.of(context)!.email,
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
                      hintText: AppLocalizations.of(context)!.password,
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
                        AppLocalizations.of(context)!.forget_password,
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
                    
                    nameOfButton: AppLocalizations.of(context)!.login,
                    onClicked: () {
                      Navigator.pushNamed(context, RoutesManager.mainLayout);
                    },
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
                          AppLocalizations.of(context)!.login_with_google,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 3,),
            SizedBox(
              height: 40.h,
              width: 75.w,
              child: AnimatedToggleSwitch<CountryOption>.dual(
                current: selectedCountry,
                first: CountryOption.egypt,
                second: CountryOption.america,
                onChanged: (value) {
                  if(value==CountryOption.egypt) {
                    provider.configLanguage(Locale("ar"));
                    selectedCountry=CountryOption.egypt;
                  } else {
                    provider.configLanguage(Locale("en"));
                    selectedCountry=CountryOption.america;
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
    );
  }
}
