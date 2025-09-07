import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvents{}
class IncrementEvent extends CounterEvents{}
class DecrementEvent extends CounterEvents{}
class ResetEvent extends CounterEvents{}

class CounterBloc extends Bloc<CounterEvents, int>{
  CounterBloc() : super(0){
    on<IncrementEvent>((event, emit) => emit(state + 1));

    on<DecrementEvent>( (event, emit) {emit(state - 1);}  );

    on<ResetEvent>((event, emit) => emit(0));
  }

} 