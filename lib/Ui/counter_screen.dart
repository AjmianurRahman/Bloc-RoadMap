import 'package:block_roadmap/Bloc/counter/counter_bloc.dart';
import 'package:block_roadmap/Bloc/counter/counter_event.dart';
import 'package:block_roadmap/Bloc/counter/counter_state.dart';
import 'package:block_roadmap/Components/text300.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text300(text: 'Counter Screen', fontSize: 16),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            //? Bloc Builder rebuilds that widget
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text300(text: state.counter.toString(), fontSize: 22);
            }),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //? Trigger the increment event.
                      context.read<CounterBloc>().add(IncrementCounter());
                    },
                    child: const Text300(text: 'Increment', fontSize: 14)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                ElevatedButton(
                    onPressed: () {
                      //? Trigger the decrement event.
                      context.read<CounterBloc>().add(DecrementCounter());
                    },
                    child: const Text300(text: 'Decrement', fontSize: 14))
              ],
            )
          ],
        ),
      ),
    );
  }
}
