import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/models/chore.dart';
import 'package:to_do_app/utils/logs.dart';

part 'local_data_source.dart';
part 'network_data_source.dart';

//TODO: испоьзовать record чтобы получать ревизию и список из getData
abstract class IDataSource<T> {
  List<T>? data;
  int revision = 0;

  void add(T item);
  void remove(T item);
  void clear();
  Future<List<T>?> getData();
  void dispose();
  void sync();
}
