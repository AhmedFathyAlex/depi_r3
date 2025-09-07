import 'package:depi_flutter/helpers/routes.dart';
import 'package:depi_flutter/news/ui/cubit/news_cubit.dart';
import 'package:depi_flutter/state_managment/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    // context.read<CounterCubit>().decrement();
                    bloc.add(DecrementEvent());
                  },
                  child: Text('decrement'),
                ),
                BlocConsumer<CounterBloc, int>(
                  listener: (context, state) {
                    if (state.isNegative) {
                      // Navigator.pushReplacementNamed(context, Routes.login);
                    }
                  },
                  builder: (context, state) {
                    return Text('$state', style: TextStyle(fontSize: 50));
                  },
                ),
                TextButton(
                  onPressed: () {
                    context.read<NewsCubit>();
                    bloc.add(IncrementEvent());
                  },
                  child: Text('increment'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                bloc.add(ResetEvent());
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
