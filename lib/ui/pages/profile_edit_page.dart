import 'package:flutter/material.dart';
import 'package:flutter_emoney/shared/theme.dart';
import 'package:flutter_emoney/ui/widgets/buttons.dart';
import 'package:flutter_emoney/ui/widgets/forms.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFormField(title: 'Username'),
                SizedBox(height: 16),
                CustomFormField(title: 'Full Name'),
                SizedBox(height: 16),
                CustomFormField(title: 'Email Address'),
                SizedBox(height: 16),
                CustomFormField(title: 'Password', obsecureText: true),
                SizedBox(height: 30),
                CustomFilledButton(
                  title: 'Update Now',
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile-edit-success');
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
