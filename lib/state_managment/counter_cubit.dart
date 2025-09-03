import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  late SharedPreferences prefs;

  final String counterKey = 'counter';

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    var savedState = getCounter();
    emit(savedState);
  }

  void increment() {
    emit(state + 1);
    saveCounter(state);
  }

  void decrement() {
    emit(state - 1);
    saveCounter(state);
  }

  void reset() {
    emit(0);
    saveCounter(state);
  }
 
  void saveCounter(int counter){
    prefs.setInt(counterKey, counter);
  } 

  int getCounter(){
    return prefs.getInt(counterKey) ?? 0;
  }

}
