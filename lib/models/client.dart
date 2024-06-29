import '../utils/logs.dart';
import 'i_data_source.dart';
import 'dart:math';

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
    revision = revision + 1;
    Logs.log('Client rev: $revision');
    data = [item, ...data ?? []];
    _localStorage?.add(item);
    _networkStorage?.add(item);
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
    List<T>? networkData;
    List<T>? localData;
    try {
      networkData = await _networkStorage?.getData();
    } catch (e) {
      Logs.log('$e');
    }
    try {
      localData = await _localStorage?.getData();
    } catch (e) {
      Logs.log('$e');
    }
    // if (networkData != null) {
    //   revision =
    //       max(_networkStorage?.revision ?? 0, _localStorage?.revision ?? 0);
    //   if (revision > _networkStorage!.revision) {
    //     data = localData;
    //     _networkStorage!.data = data;
    //     _networkStorage!.sync();
    //     revision = _networkStorage!.revision;
    //     _localStorage?.revision = revision;
    //   }
    // }
    if (networkData != null) {
      data = networkData;
      revision = _networkStorage!.revision;
      _localStorage?.data = data;
      _localStorage?.sync();
    } else {
      data = _localStorage?.data;
    }

    _networkStorage?.revision = revision;
    _localStorage?.revision = revision;

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
