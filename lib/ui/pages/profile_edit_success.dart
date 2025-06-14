import 'package:flutter/material.dart';
import 'package:flutter_emoney/shared/theme.dart';
import 'package:flutter_emoney/ui/widgets/buttons.dart';

class ProfileEditSuccess extends StatelessWidget {
  const ProfileEditSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nice Update!',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 26),
            Text(
              'Your data is save with\nour system',
              style: greyTextStyle.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            CustomFilledButton(
              width: 183,
              title: 'My Profile',
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
    );
  }
}
