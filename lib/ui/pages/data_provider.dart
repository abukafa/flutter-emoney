import 'package:flutter/material.dart';
import 'package:flutter_emoney/shared/methods.dart';
import 'package:flutter_emoney/shared/theme.dart';
import 'package:flutter_emoney/ui/widgets/buttons.dart';
import 'package:flutter_emoney/ui/widgets/provider_item.dart';

class DataProvider extends StatelessWidget {
  const DataProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Beli Data')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        children: [
          const SizedBox(height: 30),
          Text(
            'From Wallet',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Image.asset('assets/img_card_small.png', width: 80),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    formatCurrency(180000000),
                    style: greyTextStyle.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            'Select Provider',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          const ProviderItem(
            title: 'Telkomsel',
            imageUrl: 'assets/logo_telkomsel.png',
            isSelected: true,
          ),
          const ProviderItem(
            title: 'Indosat Ooredoo',
            imageUrl: 'assets/logo_indosat.png',
            isSelected: false,
          ),
          const ProviderItem(
            title: 'Singtel ID',
            imageUrl: 'assets/logo_singtel.png',
            isSelected: false,
          ),
          const SizedBox(height: 135),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/data-package');
            },
          ),
          const SizedBox(height: 57),
        ],
      ),
    );
  }
}
