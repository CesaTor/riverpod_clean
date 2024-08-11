import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_clean/core/provider/connectivity_provider.dart';
import 'package:riverpod_clean/core/router/app_router.gr.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            Consumer(builder: (context, ref, child) {
              return Text('Is connected: ${ref.connectivity}');
            }),
            ElevatedButton(
              onPressed: () {
                context.router.push(const LoginRoute());
              },
              child: const Text('Go to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
