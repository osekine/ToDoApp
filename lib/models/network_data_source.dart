part of 'i_data_source.dart';

class NetworkDataSource<T> implements IDataSource<T> {
  final DioProxy<T> _proxy = DioProxy();

  @override
  List<T>? data;

  @override
  int revision = 0;

  @override
  void add(T item) {
    data = [item, ...data ?? []];
    _proxy.save(item);
    revision = _proxy.revision;
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
  Future<List<T>?> getData() async {
    data = await _proxy.load();
    revision = _proxy.revision;
    return data;
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

class DioProxy<T> {
  final String baseUrl = 'https://hive.mrdekk.ru/todo/list';
  final String token = 'Wilwarin';
  int revision = 0;

  final _dio = Dio();

  DioProxy() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $token';
          options.headers['X-Last-Known-Revision'] = revision;
          return handler.next(options);
        },
      ),
    );
  }
  Future<List<T>> load() async {
    Logs.log('NETWORK Loading...');
    List<T>? loadedData;
    try {
      final Response<String> response = await _dio.get(baseUrl);
      if (response.statusCode == 200) {
        final jsonBody = jsonDecode(response.data!);
        final listBody = jsonBody['list'] as List;
        revision = jsonBody['revision'] as int;
        loadedData = listBody.map((e) => Chore.fromJson(e) as T).toList();
        Logs.log('Network Rev: $revision');
      }
    } catch (e) {
      Logs.log('$e');
    }
    return Future.value(loadedData ?? <T>[]);
  }

  void save(T data) async {
    Logs.log('NETWORK Saving...');
    final body = jsonEncode(
      data,
      toEncodable: ((nonEncodable) =>
          data is Chore ? data.toJson() : nonEncodable),
    );
    try {
      Logs.log('Saving: $body');

      final Response<String> response = await _dio.post(
        baseUrl,
        data: <String, dynamic>{'element': jsonDecode(body)},
        options: Options(headers: {'X-Last-Known-Revision': revision}),
      );
      revision++;
      Logs.log(response.data!);
    } catch (e) {
      Logs.log('$e');
    }
  }

  void syncronize(List<T> data) async {
    final body = data
        .map(
          (e) => jsonEncode(
            e,
            toEncodable: ((nonEncodable) =>
                e is Chore ? e.toJson() : nonEncodable),
          ),
        )
        .toList();
    final response = await _dio.patch(
      baseUrl,
      data: {'list': body, 'revision': revision},
    );
  }
}
