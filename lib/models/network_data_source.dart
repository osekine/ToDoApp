part of 'i_data_source.dart';

class NetworkDataSource<T> implements IDataSource<T> {
  @override
  List<T>? data;

  @override
  void add(T data) {
    // TODO: implement add
  }

  @override
  void clear() {
    // TODO: implement clear
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<List<T>?> getData() {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  void remove(T data) {
    // TODO: implement remove
  }
}
