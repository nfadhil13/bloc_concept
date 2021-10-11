import 'package:bloc_concept/context_ext.dart';
import 'package:bloc_concept/cubit/counter_cubit.dart';
import 'package:bloc_concept/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ow"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(builder: (context, state) {
              return Text(
                state.counterValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            }, listener: (context, state) {
              if (state.wasIncremented) {
                context.showSnackbar(
                    Text("Incremented to ${state.counterValue}"),
                    const Duration(microseconds: 300));
              } else {
                context.showSnackbar(
                    Text("Decremented to ${state.counterValue}"),
                    const Duration(microseconds: 300));
              }
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<CounterCubit>(context),
                            child: const SecondScreen(),
                          )));
                },
                child: const Text("Go To Second Screen"))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
