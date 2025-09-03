import 'package:depi_flutter/state_managment/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              context.read<CounterCubit>().decrement();
            }, child: Text('decrement')),
            BlocBuilder<CounterCubit, int>(
              builder: (context, state) {
                return Text('$state', 
                style: TextStyle(fontSize: 50));
              },
            ),
            TextButton(onPressed: () {
              context.read<CounterCubit>().increment();
            }, child: Text('increment')),
          ],
        ),
      ),
      
    );
  }
}
