import 'package:flutter/material.dart';
import 'package:flutter_emoney/shared/theme.dart';
import 'package:flutter_emoney/ui/widgets/buttons.dart';
import 'package:flutter_emoney/ui/widgets/forms.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            width: 155,
            height: 50,
            margin: EdgeInsets.only(top: 100, bottom: 100),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo_brand_light.png'),
              ),
            ),
          ),
          Text(
            'Sign In &\nGrow Your Finance',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
          ),
          SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE : EMAIL INPUT
                CustomFormField(title: 'Email Address'),
                SizedBox(height: 16),
                // NOTE : PASSWORD INPUT
                CustomFormField(title: 'Password', obsecureText: true),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text('Forgot Password', style: blueTextStyle),
                ),
                SizedBox(height: 30),
                CustomFilledButton(
                  title: 'Sign In',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home',
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          CustomTextButton(
            title: 'Create New Account',
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up');
            },
          ),
        ],
      ),
    );
  }
}
