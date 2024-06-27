import 'package:dio/dio.dart';
import 'package:to_do_app/utils/logs.dart';

part 'local_data_source.dart';
part 'network_data_source.dart';

abstract class IDataSource<T> {
  List<T>? data;

  void add(T item);
  void remove(T item);
  void clear();
  Future<List<T>?> getData();
  void dispose();
}
