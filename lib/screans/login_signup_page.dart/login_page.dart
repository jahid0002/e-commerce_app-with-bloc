import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online/bloc/login/login_bloc.dart';
import 'package:online/bloc/login/login_event.dart';
import 'package:online/bloc/login/login_state.dart';

import 'package:online/custom_widget/custom_appbar.dart';
import 'package:online/custom_widget/custom_buttons.dart';
import 'package:online/custom_widget/custom_textfield.dart';

import 'package:online/model/login_model.dart';
import 'package:online/screans/login_signup_page.dart/signup_page.dart';

import 'package:online/utilsh/color.dart';
import 'package:online/utilsh/const.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar:
          CustomAppBar.customAppBar(context: context, leaading: Container()),
      body: Padding(
        padding: const EdgeInsets.only(right: 15.0, left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Sign in to your account',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: AppColor.blackColor.withOpacity(.8)),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextField(
                  prefixIcon: Icons.email_outlined,
                  controller: emailController, hintText: 'Email'),
                SizedBox(
                  height: size.height * 0.02,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return CustomTextField(
                       prefixIcon: Icons.lock_outline,
                       icon:state.obsecureText? Icons.visibility_outlined: Icons.visibility_off_outlined,
                        obscureText: state.obsecureText,
                        showPass: () {
                          if (passController.text.isNotEmpty) {
                            context.read<LoginBloc>().add(
                                ObsecureTextLoginEvent(
                                    isShow: state.obsecureText ? false : true));
                          }
                        },
                        controller: passController,
                        hintText: 'Password');
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'Forgot password?',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return CustomButton(
                        loading: state.isLoading,
                        buttonName: 'Login',
                        onTap: () {
                          if (emailController.text.isNotEmpty &&
                              passController.text.isNotEmpty) {
                            final model = LoginModel(
                                email: emailController.text.trim(),
                                password: passController.text.trim(),
                                context: context);
                            context
                                .read<LoginBloc>()
                                .add(EmailPassLoginEvent(model: model));

                            final snackBar =
                                SnackBar(content: Text(state.signInFeedBack));

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }else{
                                 final snakbar = SnackBar(
                                 backgroundColor: AppColor.blackColor.withOpacity(0.1),
                                content: Text('Plasse fill the text field', style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColor.backgroundColor),));

                            ScaffoldMessenger.of(context).showSnackBar(snakbar);
                          }
                        });
                  },
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
              ],
            ),
            InkWell(
              onTap: () {
                AppName.pushReplacement(
                    context: context, object: const SignUpPage());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Not any account? ',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
