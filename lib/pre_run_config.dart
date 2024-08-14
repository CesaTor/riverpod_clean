part of 'main.dart';

Future<void> _preRunConfig(Future<void> Function() runApp) async {
  // Init Sentry
  const dns = String.fromEnvironment('SENTRY_DNS', defaultValue: '');
  await SentryFlutter.init(
    (options) {
      options.dsn = dns;
      options.tracesSampleRate = 1.0;
      options.profilesSampleRate = 1.0;
    },
    appRunner: runApp,
  );

  FlutterError.onError = (details) {
    if (!kDebugMode) {
      Sentry.captureException(details.exception, stackTrace: details.stack);
    }
  };
}
