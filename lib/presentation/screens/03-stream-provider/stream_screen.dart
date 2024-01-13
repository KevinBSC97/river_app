import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/providers.dart';

class StreamScreen extends ConsumerWidget {
  const StreamScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final randomNames = ref.watch(namesStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
        centerTitle: true,
      ),
      body: randomNames.when(
        // data: (data) => ListView.builder(
        //   itemCount: data.length,
        //   itemBuilder: (context, index) => ListTile(title: Text(data[index])),
        // ),
        data: (data) => Center(
          child: Text(data),
        ),
        error: (error, stackTrace) => Text('Error: $error'), 
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}