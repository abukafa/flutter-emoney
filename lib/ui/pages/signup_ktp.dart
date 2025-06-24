import 'dart:convert';
import 'dart:io' show File;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoney/blocs/auth/auth_bloc.dart';
import 'package:flutter_emoney/models/signup_model.dart';
import 'package:flutter_emoney/shared/methods.dart';
import 'package:flutter_emoney/shared/theme.dart';
import 'package:flutter_emoney/ui/widgets/buttons.dart';
import 'package:image_picker/image_picker.dart';

class SignupUploadKTP extends StatefulWidget {
  final SignUpModel data;

  const SignupUploadKTP({super.key, required this.data});

  @override
  State<SignupUploadKTP> createState() => _SignupUploadKTPState();
}

class _SignupUploadKTPState extends State<SignupUploadKTP> {
  XFile? selectedImage;

  bool validate() {
    if (selectedImage == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
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
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
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
                      'Passport/ ID Card',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomFilledButton(
                      title: 'Continue',
                      onPressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                            AuthRegister(
                              widget.data.copyWith(
                                ktp: selectedImage == null
                                    ? null
                                    : 'data:image/png;base64,${base64Encode(File(selectedImage!.path).readAsBytesSync())}',
                              ),
                            ),
                          );
                          print(widget.data);
                        } else {
                          showCustomSnackbar(
                            context,
                            'Gambar tidak boleh kosong',
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              CustomTextButton(
                title: 'Skip for Now',
                onPressed: () {
                  context.read<AuthBloc>().add(AuthRegister(widget.data));
                  print('DATA YANG DIKIRIM => ${widget.data}');
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
