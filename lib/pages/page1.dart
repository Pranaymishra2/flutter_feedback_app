import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feedback_app/bloc/navigation_bloc.dart';
import '../bloc/navigation_event.dart';

class Page1 extends StatelessWidget {
  Page1({super.key});

  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Center(
                child: Text(
                  'Remote Ward Feedbacks',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[900],
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 2),
                        blurRadius: 4,
                        color: Colors.black26,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Enter your username',
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_usernameController.text.isNotEmpty) {
                    context
                        .read<NavigationBloc>()
                        .add(GoToPage2(_usernameController.text));
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text('Enter'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
