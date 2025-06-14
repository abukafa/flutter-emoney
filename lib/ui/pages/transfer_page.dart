import 'package:flutter/material.dart';
import 'package:flutter_emoney/shared/theme.dart';
import 'package:flutter_emoney/ui/widgets/buttons.dart';
import 'package:flutter_emoney/ui/widgets/forms.dart';
import 'package:flutter_emoney/ui/widgets/transfer_recent_item.dart';
import 'package:flutter_emoney/ui/widgets/transfer_result_item.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transfer')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Text(
            'Search',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          CustomFormField(title: 'by username', isShowTitle: false),
          // buildRecentUsers(),
          buildResult(),
          const SizedBox(height: 274),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/transfer-amount');
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          const TransferRecentItem(
            imageUrl: 'assets/img_friend1.png',
            name: 'Yonna Jie',
            username: 'yoenna',
            isVerified: true,
          ),
          const TransferRecentItem(
            imageUrl: 'assets/img_friend2.png',
            name: 'Tonni Joe',
            username: 'joe',
            isVerified: false,
          ),
          const TransferRecentItem(
            imageUrl: 'assets/img_friend3.png',
            name: 'John Doe',
            username: 'doe',
            isVerified: false,
          ),
        ],
      ),
    );
  }

  Widget buildResult() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: [
              const TransferResultItem(
                imageUrl: 'assets/img_friend3.png',
                name: 'John Doe',
                username: 'doe',
                isVerified: false,
              ),
              const TransferResultItem(
                imageUrl: 'assets/img_friend4.png',
                name: 'Jenny Jude',
                username: 'jude',
                isVerified: true,
              ),
              const TransferResultItem(
                imageUrl: 'assets/img_friend1.png',
                name: 'John Doe',
                username: 'doe',
                isVerified: false,
                isSellected: true,
              ),
              const TransferResultItem(
                imageUrl: 'assets/img_friend2.png',
                name: 'Jenny Jude',
                username: 'jude',
              ),
              const TransferResultItem(
                imageUrl: 'assets/img_friend5.png',
                name: 'John Doe',
                username: 'doe',
                isVerified: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
