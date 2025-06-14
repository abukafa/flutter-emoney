import 'package:flutter/material.dart';
import 'package:flutter_emoney/shared/theme.dart';

class ProviderItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String status;
  final bool isSelected;

  const ProviderItem({
    super.key,
    required this.title,
    required this.imageUrl,
    this.status = 'Available',
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(
          width: 2,
          color: isSelected ? blueColor : whiteColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(imageUrl, height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 2),
              Text(status, style: greyTextStyle.copyWith(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
