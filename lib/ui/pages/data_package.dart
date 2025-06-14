import 'package:flutter/material.dart';
import 'package:flutter_emoney/shared/theme.dart';
import 'package:flutter_emoney/ui/pages/data_success.dart';
import 'package:flutter_emoney/ui/widgets/buttons.dart';
import 'package:flutter_emoney/ui/widgets/forms.dart';
import 'package:flutter_emoney/ui/widgets/package_item.dart';

class DataPackage extends StatelessWidget {
  const DataPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Paket Data')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 30),
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          CustomFormField(title: '+628', isShowTitle: false),
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Package',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  children: [
                    const PackageItem(
                      amount: 25,
                      price: 24000,
                      isSelected: false,
                    ),
                    const PackageItem(
                      amount: 50,
                      price: 49000,
                      isSelected: false,
                    ),
                    const PackageItem(
                      amount: 25,
                      price: 24000,
                      isSelected: true,
                    ),
                    const PackageItem(
                      amount: 50,
                      price: 49000,
                      isSelected: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 85),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => DataSuccess()),
                  (route) => false,
                );
              }
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
