import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_clean/core/router/app_router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Home Page'),
          ElevatedButton(
            onPressed: () {
              context.router.push(const LoginRoute());
            },
            child: const Text('Go to Login'),
          ),
        ],
      ),
    );
  }
}
