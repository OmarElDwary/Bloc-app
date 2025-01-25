import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/views/counter/counter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state.counter == 10) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Counter Reached 10')));
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${state.counter}',
                  style: TextStyle(fontSize: 24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(IncrementEvent());
                        },
                        icon: Icon(Icons.add)),
                    IconButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(DecrementEvent());
                        },
                        icon: Icon(Icons.remove))
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
