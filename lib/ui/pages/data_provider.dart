import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoney/blocs/auth/auth_bloc.dart';
import 'package:flutter_emoney/blocs/operator_card/operator_card_bloc.dart';
import 'package:flutter_emoney/models/operator_card_model.dart';
import 'package:flutter_emoney/shared/methods.dart';
import 'package:flutter_emoney/shared/theme.dart';
import 'package:flutter_emoney/ui/pages/data_package.dart';
import 'package:flutter_emoney/ui/widgets/buttons.dart';
import 'package:flutter_emoney/ui/widgets/provider_item.dart';

class DataProvider extends StatefulWidget {
  const DataProvider({super.key});

  @override
  State<DataProvider> createState() => _DataProviderState();
}

class _DataProviderState extends State<DataProvider> {
  OperatorCardModel? selectedOperatorCard;

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
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthInitial) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AuthSuccess) {
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
                          'Balance: ${formatCurrency(state.user.balance ?? 0)}',
                          style: greyTextStyle.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return Row(
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
              );
            },
          ),
          const SizedBox(height: 40),
          Text(
            'Select Provider',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(height: 14),
          BlocProvider(
            create: (context) => OperatorCardBloc()..add(OperatorCardGet()),
            child: BlocBuilder<OperatorCardBloc, OperatorCardState>(
              builder: (context, state) {
                print(state);
                if (state is OperatorCardSuccess) {
                  return Column(
                    children: state.operatorCards.map((operatorCard) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedOperatorCard = operatorCard;
                          });
                        },
                        child: ProviderItem(
                          operatorCard: operatorCard,
                          isSelected:
                              selectedOperatorCard?.id == operatorCard.id,
                        ),
                      );
                    }).toList(),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
      floatingActionButton: (selectedOperatorCard != null)
          ? Container(
              margin: const EdgeInsets.all(24),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DataPackage(operatorCard: selectedOperatorCard!),
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
