part of 'i_data_source.dart';

class NetworkDataSource<T> extends DioProxy<T> implements IDataSource<T> {
  @override
  List<T>? data;

  @override
  int revision = 0;

  @override
  void add(T item) {}

  @override
  void clear() {
    // TODO: implement clear
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<List<T>?> getData() async {
    // TODO: implement getData
    return load();
  }

  @override
  void remove(T data) {
    // TODO: implement remove
  }

  @override
  void sync() {
    // TODO: implement sync
  }
}

abstract class DioProxy<T> {
  final String baseUrl = 'https://hive.mrdekk.ru/todo/list';
  final String token = 'Wilwarin';
  int revision = 0;

  final _dio = Dio();

  DioProxy() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $token';
          options.headers['X-Last-Known-Revision'] = revision.toString();
          return handler.next(options);
        },
      ),
    );
  }

  Future<List<T>> load() async {
    List<T>? loadedData;
    try {
      final Response<String> response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.data!);
        final listBody = jsonBody['list'] as List;
        loadedData = listBody.map((e) => Chore.fromJson(e) as T).toList();
      }
    } catch (e) {
      Logs.log('$e');
    }
    return Future.value(loadedData ?? <T>[]);
  }

  void save(List<T> list, int revision) {
    final setListRequest = Options(
      method: 'POST',
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    try {
      final saveData = {
        'list': list.map((e) => jsonEncode(e)).toList(),
        'revision': revision,
      };
      final response =
          _dio.post(baseUrl, data: saveData, options: setListRequest);
      Logs.log('Response: $response');
    } catch (e) {
      Logs.log('$e');
    }
  }
}
