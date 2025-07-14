import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/navigation_bloc.dart';
import '../bloc/navigation_event.dart';

class Page2 extends StatelessWidget {
  final String username;
  Page2({super.key, required this.username});

  final modelController = TextEditingController();
  final versionController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Device Info')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text("Welcome, $username", style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              controller: modelController,
              decoration: const InputDecoration(labelText: 'Device Model'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: versionController,
              decoration: const InputDecoration(labelText: 'Android Version'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Issue Description'),
              maxLines: 3,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Later: Save to DB
                context.read<NavigationBloc>().add(GoToPage3());
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
