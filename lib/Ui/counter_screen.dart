import 'package:block_roadmap/Bloc/counter/counter_bloc.dart';
import 'package:block_roadmap/Bloc/counter/counter_event.dart';
import 'package:block_roadmap/Bloc/counter/counter_state.dart';
import 'package:block_roadmap/Bloc/switch%20bloc/switch_bloc.dart';
import 'package:block_roadmap/Bloc/switch%20bloc/switch_event.dart';
import 'package:block_roadmap/Bloc/switch%20bloc/switch_state.dart';
import 'package:block_roadmap/Components/text300.dart';
import 'package:flutter/cupertino.dart';
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
        backgroundColor: Colors.deepPurple,
        title: Text300(
          text: 'Counter Screen',
          fontSize: 16,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! Start of counter code ui
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
                    child: const Text300(
                      text: 'Increment',
                      fontSize: 14,
                      color: Colors.black,
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                ElevatedButton(
                    onPressed: () {
                      //? Trigger the decrement event.
                      context.read<CounterBloc>().add(DecrementCounter());
                    },
                    child: const Text300(
                      text: 'Decrement',
                      fontSize: 14,
                      color: Colors.black,
                    ))
              ],
            ),
            //! End of counter code UI

            //! Start of slider and container color UI
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text300(text: 'Notification:', fontSize: 14),
                  BlocBuilder<SwitchBloc, SwitchState>(
                      builder: (context, state) {
                    return CupertinoSwitch(
                        value: state.isSwitch,
                        onChanged: (newValue) {
                          context
                              .read<SwitchBloc>()
                              .add(EnableOrDisableNotification());
                        });
                  }),
                ],
              ),
            ),

            BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 200,
                color: Colors.deepPurple.withOpacity(state.slider),
              );
            }),

            BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
              return CupertinoSlider(
                  value: state.slider,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(SliderEvent(slider: value));
                  });
            }),
          ],
        ),
      ),
    );
  }
}
