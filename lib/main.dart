import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/resgister_page.dart';
import 'package:chat_app/pages/viewmodel/auth/auth_cubit.dart';
import 'package:chat_app/pages/viewmodel/chat/chat_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => LoginCubit()),
        // BlocProvider(create: (context) => ResgisterCubit())d,
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        
      ],
      child: MaterialApp(
        routes: {
          'LoginPage': (context) => LoginPage(),
          ResgisterPage.id: (context) => ResgisterPage(),
          ChatPage.id: (context) => ChatPage(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: 'LoginPage',
      ),
    );
  }
}
