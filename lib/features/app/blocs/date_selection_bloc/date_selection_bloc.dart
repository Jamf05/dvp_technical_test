import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'date_selection_event.dart';
part 'date_selection_state.dart';

class DateSelectionBloc extends Bloc<DateSelectionEvent, DateSelectionState> {
  DateSelectionBloc() : super(DateSelectionInitial());

  @override
  Stream<DateSelectionState> mapEventToState(
    DateSelectionEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
