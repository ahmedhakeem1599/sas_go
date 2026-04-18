import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/local/secure_storage_service.dart';
import '../network/local/shared_pref.dart';
import '../network/remote/api/dio_consumer.dart';

final sl = GetIt.instance;

Future<void> configureDepInjections() async {
  /// Core
  sl.registerLazySingleton<DioConsumer>(() => DioConsumer());

  /// SecureStorage
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton<SecureStorageService>(() => SecureStorageServiceImpl(sl()),);
  /// SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);
  sl.registerLazySingleton<LocalStorageService>(() => SharedPrefImpl(sl()));

}
