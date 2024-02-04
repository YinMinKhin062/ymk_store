import 'package:get_storage/get_storage.dart';
import 'package:ymk_store/features/personalization/screens/address/addNewAddress.dart';

class LocalStorage {
  // static final LocalStorage __instance = LocalStorage._internal();

  static LocalStorage? _instance;
  late final GetStorage _storage;

  factory LocalStorage.instance() {
    _instance ??= LocalStorage._internal();

    return _instance!;
  }

  LocalStorage._internal();

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = LocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

  // final _storage = GetStorage();

  //save data on Storage
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  //read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  //remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  //clear all data
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
