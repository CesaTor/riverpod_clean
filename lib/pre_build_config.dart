part of 'main.dart';

Future<Widget> _preBuildConfig(
  Widget Function(WidgetRef ref) app,
) async {
  WidgetsFlutterBinding.ensureInitialized();

  return ProviderScope(
    overrides: [
      // Init SharedPreferences
      sharedPreferencesProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      )
    ],
    child: Consumer(builder: (_, ref, __) {
      return app(ref);
    }),
  );
}
