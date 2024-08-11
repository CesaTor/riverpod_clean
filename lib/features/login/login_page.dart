import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_clean/core/auth/provider/authentication_provider.dart';
import 'package:riverpod_clean/core/router/app_router.gr.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login Page')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login Page'),
              Consumer(
                builder: (context, ref, child) => ElevatedButton(
                  onPressed: () {
                    ref
                        .read(authenticationProvider.notifier)
                        .login()
                        .then((logged) {
                      if (context.mounted) {
                        logged
                            ? AutoRouter.of(context).push(const HomeRoute())
                            : debugPrint('Login failed');
                      }
                    });
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ));
  }
}
