part of 'i_data_source.dart';

class NetworkDataSource<T> implements IDataSource<T> {
  @override
  List<T>? data;

  String baseUrl = 'https://beta.mrdekk.ru/todo/list';
  String token = 'Wilwarin';

  final dio = Dio();

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
    // final getListRequest = Options(
    //   method: 'GET',
    //   headers: {
    //     'Authorization': 'Bearer $token',
    //   },
    // );
    // try {
    //   final response = await dio.get(baseUrl, options: getListRequest);
    // } catch (e) {
    //   Logs.log('$e');
    // }

    throw UnimplementedError();
  }

  @override
  void remove(T data) {
    // TODO: implement remove
  }
}
