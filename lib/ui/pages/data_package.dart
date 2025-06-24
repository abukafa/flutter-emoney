import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoney/blocs/auth/auth_bloc.dart';
import 'package:flutter_emoney/blocs/data_plan/data_plan_bloc.dart';
import 'package:flutter_emoney/models/data_plan_form_model.dart';
import 'package:flutter_emoney/models/data_plan_model.dart';
import 'package:flutter_emoney/models/operator_card_model.dart';
import 'package:flutter_emoney/shared/methods.dart';
import 'package:flutter_emoney/shared/theme.dart';
import 'package:flutter_emoney/ui/widgets/buttons.dart';
import 'package:flutter_emoney/ui/widgets/forms.dart';
import 'package:flutter_emoney/ui/widgets/package_item.dart';

class DataPackage extends StatefulWidget {
  final OperatorCardModel? operatorCard;

  const DataPackage({super.key, this.operatorCard});

  @override
  State<DataPackage> createState() => _DataPackageState();
}

class _DataPackageState extends State<DataPackage> {
  final phoneController = TextEditingController(text: '+628');
  DataPlanModel? selectedDataPlan;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataPlanBloc(),
      child: BlocConsumer<DataPlanBloc, DataPlanState>(
        listener: (context, state) {
          if (state is DataPlanFailed) {
            showCustomSnackbar(context, state.e);
          } else if (state is DataPlanSuccess) {
            context.read<AuthBloc>().add(
              AuthUpdateBalance(selectedDataPlan!.price! * -1),
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/data-success',
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is DataPlanLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return Scaffold(
            appBar: AppBar(title: Text('Paket Data')),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 30),
                Text(
                  'Phone Number',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 14),
                CustomFormField(
                  title: '+628',
                  isShowTitle: false,
                  controller: phoneController,
                  // Removed unsupported 'onChanged' parameter
                ),
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
                        children: (widget.operatorCard?.dataPlans ?? []).map((
                          dataPlan,
                        ) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDataPlan = dataPlan;
                              });
                            },
                            child: PackageItem(
                              dataPlan: dataPlan,
                              isSelected: selectedDataPlan?.id == dataPlan.id,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButton:
                (selectedDataPlan != null && phoneController.text.length >= 10)
                ? Container(
                    margin: const EdgeInsets.all(24),
                    child: CustomFilledButton(
                      title: 'Continue',
                      onPressed: () async {
                        if (await Navigator.pushNamed(context, '/pin') ==
                            true) {
                          final authState = context.read<AuthBloc>().state;
                          String pin = '';
                          if (authState is AuthSuccess) {
                            pin = authState.user.pin!;
                          }
                          context.read<DataPlanBloc>().add(
                            DataPlanPost(
                              DataPlanFormModel(
                                dataPlanId: selectedDataPlan!.id,
                                phoneNumber: phoneController.text,
                                pin: pin,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  )
                : Container(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
        },
      ),
    );
  }
}
