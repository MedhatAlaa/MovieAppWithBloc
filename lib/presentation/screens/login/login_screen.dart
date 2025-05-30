import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../../componets/components.dart';
import '../../resources/assets_manger.dart';
import '../../resources/color_manger.dart';
import '../../resources/routes_manger.dart';
import '../../resources/string_manger.dart';
import '../../resources/values_manger.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPaddingManger.p12),
            child: Form(
              child: Column(
                children: [
                  Image.asset(
                    AssetsManger.splashLogo,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.57,
                  ),
                  const SizedBox(
                    height: AppSizeManger.s60,
                  ),
                  TextFormFiledComponent(
                    textEditingController: emailController,
                    textInputType: TextInputType.emailAddress,
                    labelText: AppStringManger.email,
                    hintText: AppStringManger.email,
                    textStyleColor: ColorManger.white,
                    cursorColor: ColorManger.primary,
                    validate: (email) {
                      if (!email!.contains(AppStringManger.emailCondition)) {
                        return AppStringManger.emailHint;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: AppSizeManger.s20,
                  ),
                  TextFormFiledComponent(
                    textEditingController: passController,
                    textInputType: TextInputType.visiblePassword,
                    labelText: AppStringManger.password,
                    hintText: AppStringManger.password,
                    cursorColor: ColorManger.primary,
                    textStyleColor: ColorManger.white,
                    obscureText: false,
                    suffixIcon: IconButton(
                      onPressed: () {
                        // loginCubit.changeSuffixIcon();
                      },
                      icon: const Icon(
                        Icons.visibility_off_rounded,
                      ),
                    ),
                    validate: (password) {
                      if (password!.length < 4) {
                        return AppStringManger.passwordHint;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: AppSizeManger.s24,
                  ),
                  ConditionalBuilder(
                    condition: true,
                    builder: (BuildContext context) =>
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.movieRoute);
                            },
                            child: const Text(
                              AppStringManger.login,
                            ),
                          ),
                        ),
                    fallback: (BuildContext context) =>
                        Center(
                          child: CircularProgressIndicator(
                            color: ColorManger.primary,
                          ),
                        ),
                  ),
                  const SizedBox(
                    height: AppSizeManger.s4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            // Navigator.pushNamed(
                            //     context, Routes.forgetPasswordRoute);
                          },
                          child: Text(
                            AppStringManger.forgetPassword,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodySmall,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            // Navigator.pushNamed(
                            // context, Routes.registerRoute);
                          },
                          child: Text(
                            AppStringManger.register,
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodySmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
