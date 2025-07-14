import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/navigation_bloc.dart';
import 'bloc/navigation_state.dart';
import 'pages/page1.dart';
import 'pages/page2.dart';
import 'pages/page3.dart';
import 'pages/page4.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => NavigationBloc(),
      child: const FeedbackApp(),
    ),
  );
}

class FeedbackApp extends StatelessWidget {
  const FeedbackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remote Ward Feedback',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      home: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is Page1State) return Page1();
          if (state is Page2State) return Page2(username: state.username);
          if (state is Page3State) return Page3();
          if (state is Page4State) return Page4();
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}
