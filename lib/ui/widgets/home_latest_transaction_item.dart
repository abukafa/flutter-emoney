import 'package:flutter/material.dart';
import 'package:flutter_emoney/models/transaction_model.dart';
import 'package:flutter_emoney/shared/methods.dart';
import 'package:flutter_emoney/shared/theme.dart';
import 'package:intl/intl.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const HomeLatestTransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Image(
            image: AssetImage(
              'assets/ico_circle_${transaction.transactionType.code}.png',
            ),
            width: 48,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.transactionType.name.toString(),
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  DateFormat(
                    'MMM d',
                  ).format(transaction.createAt ?? DateTime.now()),
                  style: greyTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              formatCurrency(
                transaction.amount ?? 0,
                symbol: transaction.transactionType.action == 'cr'
                    ? '+ '
                    : '- ',
              ),
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
          ),
        ],
      ),
    );
  }
}
