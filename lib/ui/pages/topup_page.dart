import 'package:flutter/material.dart';
import 'package:flutter_emoney/shared/theme.dart';
import 'package:flutter_emoney/ui/widgets/bank_item.dart';
import 'package:flutter_emoney/ui/widgets/buttons.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top Up')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        children: [
          const SizedBox(height: 30),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset('assets/img_card_small.png', width: 80),
              const SizedBox(width: 16),
              Column(
                children: [
                  Text(
                    '8008 2208 1996',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Angga Rizky',
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          const BankItem(
            title: 'BANK BCA',
            imageUrl: 'assets/logo_bca.png',
            isSelected: true,
          ),
          const BankItem(title: 'BANK BNI', imageUrl: 'assets/logo_bni.png'),
          const BankItem(
            title: 'BANK Mandiri',
            imageUrl: 'assets/logo_mandiri.png',
          ),
          const BankItem(title: 'BANK BCA', imageUrl: 'assets/logo_ocbc.png'),
          const SizedBox(height: 12),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/topup-amount');
            },
          ),
          const SizedBox(height: 57),
        ],
      ),
    );
  }
}
