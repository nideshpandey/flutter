import 'package:counter_provider/counter_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Count is: ${context.watch<CounterLogic>().count}'),
          const Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () => context.read<CounterLogic>().decrement(),
                child: const Icon(Icons.remove),
              ),
              const Padding(padding: EdgeInsets.only(left: 10)),
              FloatingActionButton(
                child: const Icon(Icons.refresh),
                onPressed: () => context.read<CounterLogic>().reset(),
              ),
              const Padding(padding: EdgeInsets.only(left: 10)),
              FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () => context.read<CounterLogic>().increment(),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
