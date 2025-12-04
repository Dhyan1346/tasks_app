import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class AsyncDataWidget<T> extends StatelessWidget {
  final AsyncValue<T> asyncValue; // The data from FutureProvider
  final Widget Function(T data) builder; // How to display the data

  const AsyncDataWidget({
    required this.asyncValue,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return asyncValue.when(
      loading: () => Center(child: CircularProgressIndicator(color: Colors.red,)),
      error: (err, stack) => Text('Error: $err'),
      data: builder,
    ); // Use the builder function to display data
  }
}
