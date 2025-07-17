import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feedback_app/bloc/navigation_event.dart';
import 'package:flutter/services.dart';
import '../bloc/navigation_bloc.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback Portal"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),

              /// 🏷️ Title
              Text(
                'Remote Ward Feedbacks',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                      letterSpacing: 1.2,
                    ),
              ),

              const SizedBox(height: 40),

              /// 👤 Username Input
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Enter your username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.teal.shade50,
                ),
              ),

              const SizedBox(height: 30),

              /// 🚀 Enter Button
              ElevatedButton.icon(
                onPressed: () async {
                  final username = usernameController.text.trim();

                  if (username.isNotEmpty) {
                    context.read<NavigationBloc>().add(GoToPage2(username));
                  } else {
                    HapticFeedback.mediumImpact();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter a username")),
                    );
                  }
                },
                icon: const Icon(Icons.login),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text('Enter'),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}