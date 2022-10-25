part of 'date_selection_bloc.dart';

abstract class DateSelectionState extends Equatable {
  const DateSelectionState();
  
  @override
  List<Object> get props => [];
}

class DateSelectionInitial extends DateSelectionState {}
