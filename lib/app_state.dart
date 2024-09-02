import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _YardSalesMeeting =
          await secureStorage.read(key: 'ff_YardSalesMeeting') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_YardSalesMeeting'))!)
              : _YardSalesMeeting;
    });
    await _safeInitAsync(() async {
      _firstTimeBuyer =
          await secureStorage.getBool('ff_firstTimeBuyer') ?? _firstTimeBuyer;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<String> _Categories = [
    'Electronics',
    'Fashion',
    'Gardening',
    'Vintage',
    'Kitchen',
    'Sports',
    'Toys',
    'Furniture'
  ];
  List<String> get Categories => _Categories;
  set Categories(List<String> value) {
    _Categories = value;
  }

  void addToCategories(String value) {
    Categories.add(value);
  }

  void removeFromCategories(String value) {
    Categories.remove(value);
  }

  void removeAtIndexFromCategories(int index) {
    Categories.removeAt(index);
  }

  void updateCategoriesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    Categories[index] = updateFn(_Categories[index]);
  }

  void insertAtIndexInCategories(int index, String value) {
    Categories.insert(index, value);
  }

  DateTime? _YardSalesMeeting =
      DateTime.fromMillisecondsSinceEpoch(1704067200000);
  DateTime? get YardSalesMeeting => _YardSalesMeeting;
  set YardSalesMeeting(DateTime? value) {
    _YardSalesMeeting = value;
    value != null
        ? secureStorage.setInt(
            'ff_YardSalesMeeting', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_YardSalesMeeting');
  }

  void deleteYardSalesMeeting() {
    secureStorage.delete(key: 'ff_YardSalesMeeting');
  }

  bool _firstTimeBuyer = true;
  bool get firstTimeBuyer => _firstTimeBuyer;
  set firstTimeBuyer(bool value) {
    _firstTimeBuyer = value;
    secureStorage.setBool('ff_firstTimeBuyer', value);
  }

  void deleteFirstTimeBuyer() {
    secureStorage.delete(key: 'ff_firstTimeBuyer');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
