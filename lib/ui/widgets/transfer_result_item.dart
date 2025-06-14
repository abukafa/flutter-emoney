import 'package:flutter/material.dart';
import 'package:flutter_emoney/shared/theme.dart';

class TransferResultItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String username;
  final bool isVerified;
  final bool isSellected;

  const TransferResultItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.username,
    this.isVerified = false,
    this.isSellected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 175,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 22),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSellected ? blueColor : whiteColor),
      ),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(imageUrl)),
            ),
            child: isVerified
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 14,
                        ),
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 13),
          Text(
            name,
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(height: 2),
          Text('@$username', style: greyTextStyle.copyWith(fontSize: 12)),
        ],
      ),
    );
  }
}
