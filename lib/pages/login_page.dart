// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'package:chat_app/Widgets/custom_Button.dart';
import 'package:chat_app/Widgets/custom_text_filed.dart';
import 'package:chat_app/constant.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/resgister_page.dart';
import 'package:chat_app/pages/viewmodel/auth/auth_cubit.dart';
import 'package:chat_app/pages/viewmodel/chat/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'LoginPage';
  String? email;
  String? password;
  @override
  GlobalKey<FormState> formKey = GlobalKey();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16)),
                content: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(width: 20),
                    const Text(
                      'جاري تسجيل الدخول...',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            },
          );
          return;
        }
        Navigator.of(context, rootNavigator: true).pop();
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is LoginSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          context.read<ChatCubit>().getMessages();
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
        }
      },
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                Spacer(
                  flex: 1,
                ),
                Image.asset(
                  kImage,
                  height: 100,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "chat App",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                CustomFormTextFiled(
                  onChanged: (date) {
                    email = date;
                  },
                  hintText: 'Email',
                ),
                CustomFormTextFiled(
                  obscureText: true,
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context
                          .read<AuthCubit>()
                          .loginUser(email: email!, password: password!);
                    }
                  },
                  text: 'LOGIN',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'dont\'t have an account?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ResgisterPage.id);
                      },
                      child: Text(
                        " Register",
                        style: TextStyle(
                          color: Color(0xffC7EDE6),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(
                  flex: 3,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
