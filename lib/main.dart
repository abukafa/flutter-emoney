import 'package:flutter/material.dart';
import 'package:flutter_emoney/blocs/auth/auth_bloc.dart';
import 'package:flutter_emoney/shared/theme.dart';
import 'package:flutter_emoney/ui/pages/data_package.dart';
import 'package:flutter_emoney/ui/pages/data_provider.dart';
import 'package:flutter_emoney/ui/pages/data_success.dart';
import 'package:flutter_emoney/ui/pages/home_page.dart';
import 'package:flutter_emoney/ui/pages/onboarding_page.dart';
import 'package:flutter_emoney/ui/pages/pin_page.dart';
import 'package:flutter_emoney/ui/pages/profile_edit_page.dart';
import 'package:flutter_emoney/ui/pages/profile_edit_pin_page.dart';
import 'package:flutter_emoney/ui/pages/profile_edit_success.dart';
import 'package:flutter_emoney/ui/pages/profile_page.dart';
import 'package:flutter_emoney/ui/pages/signin_page.dart';
import 'package:flutter_emoney/ui/pages/signup_page.dart';
import 'package:flutter_emoney/ui/pages/signup_success.dart';
import 'package:flutter_emoney/ui/pages/splash_page.dart';
import 'package:flutter_emoney/ui/pages/topup_amount_page.dart';
import 'package:flutter_emoney/ui/pages/topup_page.dart';
import 'package:flutter_emoney/ui/pages/topup_success.dart';
import 'package:flutter_emoney/ui/pages/transfer_amount_page.dart';
import 'package:flutter_emoney/ui/pages/transfer_page.dart';
import 'package:flutter_emoney/ui/pages/transfer_success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: blackColor),
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
        ),
        routes: {
          '/': (context) => SplashPage(),
          '/onboarding': (context) => OnboardingPage(),
          '/sign-in': (context) => SigninPage(),
          '/sign-up': (context) => SignupPage(),
          '/sign-up-success': (context) => SignupSuccess(),
          '/home': (context) => HomePage(),
          '/profile': (context) => ProfilePage(),
          '/pin': (context) => PinPage(),
          '/profile-edit': (context) => ProfileEditPage(),
          '/profile-edit-pin': (context) => ProfileEditPinPage(),
          '/profile-edit-success': (context) => ProfileEditSuccess(),
          '/topup': (context) => TopupPage(),
          '/topup-amount': (context) => TopupAmountPage(),
          '/topup-success': (context) => TopupSuccess(),
          '/transfer': (context) => TransferPage(),
          '/transfer-amount': (context) => TransferAmountPage(),
          '/transfer-success': (context) => TransferSuccess(),
          '/data-provider': (context) => DataProvider(),
          '/data-package': (context) => DataPackage(),
          '/data-success': (context) => DataSuccess(),
        },
      ),
    );
  }
}
