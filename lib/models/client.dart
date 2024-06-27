import 'i_data_source.dart';

class ClientModel<T> implements IDataSource<T> {
  IDataSource<T>? _localStorage;
  IDataSource<T>? _networkStorage;

  @override
  List<T>? data;

  ClientModel({this.data}) {
    _localStorage = LocalDataSource<T>();
    _networkStorage = NetworkDataSource<T>();
  }

  @override
  void add(T item) {
    data = [item, ...data ?? []];
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
      _networkStorage?.getData();
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  void remove(T item) {
    // data?.remove(item);
    data = data?.where((element) => element != item).toList();
  }
}
