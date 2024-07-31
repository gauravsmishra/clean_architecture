import 'package:flutter/material.dart';

abstract class WidgetView<T1, T2> extends StatelessWidget {
  final T2 controllerState;

  T1 get widget => (controllerState as State).widget as T1;

  const WidgetView(this.controllerState, {super.key});

  @override
  Widget build(BuildContext context);
}
