// counter_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterState {}

class InitialState extends CounterState {}

class LoadingState extends CounterState {
  int index = 0;
  LoadingState(this.index);
}

class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class SuccessState extends CounterState {
  int count = 0;

  SuccessState(this.count);
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int count = 0;
  int anotherCount = 0;

  CounterBloc() : super(InitialState()) {
    on<IncrementEvent>((event, emit) async {
      emit(LoadingState(0));
      await Future.delayed(Duration(seconds: 1));
      count++;
      emit(SuccessState(count));
    });
  }
}
