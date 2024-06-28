import '../utils/logs.dart';
import 'i_data_source.dart';

class ClientModel<T> implements IDataSource<T> {
  IDataSource<T>? _localStorage;
  IDataSource<T>? _networkStorage;

  @override
  List<T>? data;

  @override
  int revision = 0;

  ClientModel({this.data}) {
    _localStorage = LocalDataSource<T>();
    _networkStorage = NetworkDataSource<T>();
    getData();
  }

  @override
  void add(T item) {
    //TODO: add network choose
    revision = revision + 1;
    Logs.log('Client rev: $revision');
    data = [item, ...data ?? []];
    _localStorage?.add(item);
  }

  @override
  void clear() {
    data?.clear();
  }

  @override
  void dispose() {
    _localStorage?.dispose();
    _networkStorage?.dispose();
  }

  @override
  Future<List<T>?> getData() async {
    try {
      data = await _networkStorage?.getData();
    } catch (e) {
      Logs.log('$e');
      try {
        data = await _localStorage?.getData();
        revision = _localStorage?.revision ?? 0;
      } catch (e) {
        Logs.log('$e');
      }
    }
    return data;
  }

  @override
  void remove(T item) {
    data?.remove(item);
    _localStorage?.remove(item);
  }

  @override
  void sync() {
    _localStorage?.sync();
  }
}
