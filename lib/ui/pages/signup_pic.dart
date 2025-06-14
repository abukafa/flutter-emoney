import 'package:flutter/material.dart';
import 'package:flutter_emoney/shared/theme.dart';
import 'package:flutter_emoney/ui/widgets/buttons.dart';
import 'package:flutter_emoney/ui/widgets/forms.dart';

class SignupUploadPic extends StatelessWidget {
  const SignupUploadPic({super.key});

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
            'Join Us to Unlock\nYour Growth',
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // NOTE : NOT UPLOAD
                // Container(
                //   width: 120,
                //   height: 120,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: lightBackgroundColor,
                //   ),
                //   child: Center(
                //     child: Image.asset('assets/ico_upload.png', width: 32),
                //   ),
                // ),
                // NOTE : UPLOADED
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/img_profile.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Syaina Hanna',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                // NOTE : SET PIN INPUT
                SizedBox(height: 30),
                CustomFormField(
                  title: 'Set PIN (8 digit numbers)',
                  obsecureText: true,
                ),
                SizedBox(height: 30),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign-up-upload-ktp');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
