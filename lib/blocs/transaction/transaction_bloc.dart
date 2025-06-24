import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_emoney/models/transaction_model.dart';
import 'package:flutter_emoney/services/transaction_service.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      if (event is TransactionGet) {
        emit(TransactionLoading());
        try {
          final transactions = await TransactionService().getTransactions();
          emit(TransactionSuccess(transactions));
        } catch (e) {
          emit(TransactionFailed(e.toString()));
        }
      }
    });
  }
}
