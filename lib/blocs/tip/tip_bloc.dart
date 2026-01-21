import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_emoney/models/tip_model.dart';
import 'package:flutter_emoney/services/tip_service.dart';

part 'tip_event.dart';
part 'tip_state.dart';

class TipBloc extends Bloc<TipEvent, TipState> {
  TipBloc() : super(TipInitial()) {
    on<TipGet>((event, emit) async {
      emit(TipLoading());
      try {
        final tips = await TipService().getTip();
        emit(TipSuccess(tips));
      } catch (e) {
        emit(TipFailed(e.toString()));
      }
    });
  }
}
