import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online/bloc/sign_up/signin_bloc.dart';
import 'package:online/bloc/sign_up/signin_event.dart';
import 'package:online/bloc/sign_up/signin_state.dart';
import 'package:online/custom_widget/custom_appbar.dart';
import 'package:online/custom_widget/custom_buttons.dart';
import 'package:online/custom_widget/custom_textfield.dart';
import 'package:online/model/sign_in_model.dart';
import 'package:online/screans/login_signup_page.dart/login_page.dart';
import 'package:online/screans/nav_page.dart/nave_page.dart';
import 'package:online/utilsh/color.dart';
import 'package:online/utilsh/const.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final userNameController = TextEditingController();
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
                  'Sign Up!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  'Create an account so you can oder you \nfavoratie products esily and quickly',
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
                  prefixIcon: Icons.account_box_outlined,
                    controller: userNameController, hintText: 'User Name'),
                SizedBox(
                  height: size.height * 0.02,
                ),
                CustomTextField(
                  prefixIcon: Icons.email_outlined,
                  controller: emailController, hintText: 'Email'),
                SizedBox(
                  height: size.height * 0.02,
                ),
                BlocBuilder<SignInBloc, SigninState>(
                  builder: (context, state) {
                    return CustomTextField(
                       prefixIcon: Icons.lock_outline,
                        icon:state.obsecureText? Icons.visibility_outlined: Icons.visibility_off_outlined,
                        obscureText: state.obsecureText,
                        showPass: () {
                          if (passController.text.isNotEmpty) {
                            context.read<SignInBloc>().add(ObsecureTextEvent(isShow: state.obsecureText ? false: true));
                          }
                        },
                        controller: passController,
                        hintText: 'Password');
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                BlocBuilder<SignInBloc, SigninState>(
                  builder: (context, state) {
                    return CustomButton(
                        loading: state.isLoading,
                        buttonName: 'Sign Up',
                        onTap: () {
                          if (userNameController.text.isNotEmpty &&
                              emailController.text.isNotEmpty &&
                              passController.text.isNotEmpty) {
                            SignInModel model = SignInModel(
                                email: emailController.text.trim(),
                                password: passController.text.trim(),
                                userName: userNameController.text.trim(),
                                context: context
                                
                                );
                            context
                                .read<SignInBloc>()
                                .add(SigninEvent(model: model));

                            if (state.statas == Statas.success) {
                              AppName.pushReplacement(
                                  context: context, object: const NavePage());
                            }
                          } else {
                            
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
                    context: context, object: const LoginPage());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'All ready have an account? ',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    'Login',
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
