import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_provider.g.dart';

@Riverpod(keepAlive: true)
class Connectivity extends _$Connectivity {
  @override
  Stream<bool> build() => InternetConnection()
      .onStatusChange
      .map((status) => status == InternetStatus.connected);
}

extension InternetConnectionExt on WidgetRef {
  bool get connectivity => watch(connectivityProvider).valueOrNull ?? false;
}
