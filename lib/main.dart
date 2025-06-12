import 'package:flutter/material.dart';
import 'package:flutter_emoney/ui/pages/home_page.dart';
import 'package:flutter_emoney/ui/pages/onboarding_page.dart';
import 'package:flutter_emoney/ui/pages/signin_page.dart';
import 'package:flutter_emoney/ui/pages/signup_ktp.dart';
import 'package:flutter_emoney/ui/pages/signup_page.dart';
import 'package:flutter_emoney/ui/pages/signup_pic.dart';
import 'package:flutter_emoney/ui/pages/signup_success.dart';
import 'package:flutter_emoney/ui/pages/splash_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/onboarding': (context) => OnboardingPage(),
        '/sign-in': (context) => SigninPage(),
        '/sign-up': (context) => SignupPage(),
        '/sign-up-upload-pic': (context) => SignupUploadPic(),
        '/sign-up-upload-ktp': (context) => SignupUploadKTP(),
        '/sign-up-success': (context) => SignupSuccess(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
