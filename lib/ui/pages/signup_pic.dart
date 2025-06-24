import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_emoney/models/signup_model.dart';
import 'package:flutter_emoney/shared/methods.dart';
import 'package:flutter_emoney/shared/theme.dart';
import 'package:flutter_emoney/ui/pages/signup_ktp.dart';
import 'package:flutter_emoney/ui/widgets/buttons.dart';
import 'package:flutter_emoney/ui/widgets/forms.dart';
import 'package:image_picker/image_picker.dart';

class SignupUploadPic extends StatefulWidget {
  final SignUpModel data;

  const SignupUploadPic({super.key, required this.data});

  @override
  State<SignupUploadPic> createState() => _SignupUploadPicState();
}

class _SignupUploadPicState extends State<SignupUploadPic> {
  final pinController = TextEditingController(text: '');
  XFile? selectedImage;

  bool validate() {
    if (pinController.text.length != 6) {
      return false;
    }
    return true;
  }

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
                GestureDetector(
                  onTap: () async {
                    final image = await selectImage();
                    setState(() {
                      selectedImage = image;
                    });
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightBackgroundColor,
                      image: selectedImage == null
                          ? null
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(selectedImage!.path)),
                            ),
                    ),
                    child: selectedImage != null
                        ? null
                        : Center(
                            child: Image.asset(
                              'assets/ico_upload.png',
                              width: 32,
                            ),
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
                  controller: pinController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 30),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    if (validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupUploadKTP(
                            data: widget.data.copyWith(
                              pin: pinController.text,
                              profilePicture: selectedImage == null
                                  ? null
                                  : 'data:image/png;base64,${base64Encode(File(selectedImage!.path).readAsBytesSync())}',
                            ),
                          ),
                        ),
                      );
                    } else {
                      showCustomSnackbar(context, 'PIN harus 6 digit');
                    }
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
