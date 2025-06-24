import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoney/blocs/auth/auth_bloc.dart';
import 'package:flutter_emoney/blocs/payment_method/payment_method_bloc.dart';
import 'package:flutter_emoney/models/payment_method_model.dart';
import 'package:flutter_emoney/models/topup_model.dart';
import 'package:flutter_emoney/shared/theme.dart';
import 'package:flutter_emoney/ui/pages/topup_amount_page.dart';
import 'package:flutter_emoney/ui/widgets/bank_item.dart';
import 'package:flutter_emoney/ui/widgets/buttons.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  PaymentMethodModel? selectedPaymentMethod;

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
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSuccess) {
                return Row(
                  children: [
                    Image.asset('assets/img_card_small.png', width: 80),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (state.user.cardNumber ?? '')
                              .replaceAllMapped(
                                RegExp(r".{4}"),
                                (match) => "${match.group(0)} ",
                              )
                              .trim(),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          state.user.name.toString(),
                          style: greyTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          const SizedBox(height: 40),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          BlocProvider(
            create: (context) => PaymentMethodBloc()..add(PaymentMethodGet()),
            child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
              builder: (context, state) {
                if (state is PaymentMethodSuccess) {
                  return Column(
                    children: [
                      ...state.paymentMethods.map((paymentMethod) {
                        return GestureDetector(
                          onTap: () => setState(() {
                            selectedPaymentMethod = paymentMethod;
                          }),
                          child: BankItem(
                            paymentMethod: paymentMethod,
                            isSelected:
                                paymentMethod.id == selectedPaymentMethod?.id,
                          ),
                        );
                      }).toList(),
                    ],
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
      floatingActionButton: (selectedPaymentMethod != null)
          ? Container(
              margin: const EdgeInsets.all(24),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopupAmountPage(
                        data: TopupModel(
                          amount: '0',
                          pin: '',
                          paymentMethodCode: selectedPaymentMethod!.code,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
