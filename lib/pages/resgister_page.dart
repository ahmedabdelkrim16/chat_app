// ignore_for_file: use_build_context_synchronously, must_be_immutable
import 'package:chat_app/Widgets/custom_Button.dart';
import 'package:chat_app/Widgets/custom_text_filed.dart';
import 'package:chat_app/constant.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/viewmodel/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResgisterPage extends StatelessWidget {
  String? email;
  static String id = 'ResgisterPage';
  String? password;

  @override
  GlobalKey<FormState> formKey = GlobalKey();

  ResgisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResgisterLoading) {
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
                      'جاري انشاء الحساب...',
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
        if (state is ResgisterFailure) {
          Navigator.of(context, rootNavigator: true).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state is ResgisterSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
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
                  'assets/images/scholar.png',
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
                  "REGISTER",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                CustomFormTextFiled(
                  onChanged: (data) {
                    email = data;
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
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      context
                          .read<AuthCubit>()
                          .resgisterUser(email: email!, password: password!);
                    }
                  },
                  text: 'REGISTER',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        " Login",
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

  // Future<void> resgisterUser() async {
  //   UserCredential user =
  //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //     email: email!,
  //     password: password!,
  //   );
  // }
}
