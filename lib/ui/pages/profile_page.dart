import 'package:flutter/material.dart';
import 'package:flutter_emoney/shared/theme.dart';
import 'package:flutter_emoney/ui/widgets/buttons.dart';
import 'package:flutter_emoney/ui/widgets/profile_menu_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Profile')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/img_profile.png'),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Shayna Hanna',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 40),
                ProfileMenuItem(
                  iconUrl: 'assets/ico_profile.png',
                  title: 'Edit Profile',
                  onTap: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      if (!context.mounted) return;
                      Navigator.pushNamed(context, '/profile-edit');
                    }
                  },
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ico_mypin.png',
                  title: 'My Pin',
                  onTap: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      Navigator.pushNamed(context, '/profile-edit-pin');
                    }
                  },
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ico_wallet.png',
                  title: 'Wallet Settings',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ico_reward.png',
                  title: 'My Rewards',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ico_help.png',
                  title: 'Help Center',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/ico_logout.png',
                  title: 'Log Out',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 87),
          CustomTextButton(title: 'Report a Problem', onPressed: () {}),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
