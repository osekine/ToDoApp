part of 'i_data_source.dart';

class LocalDataSource<T> extends LocalStorageProxy<T>
    implements IDataSource<T> {
  @override
  List<T>? data;

  @override
  void add(T item) {
    data = [item, ...data ?? []];
    save(data!);
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
    data = await load();
    return load();
  }

  @override
  void remove(T item) {
    data?.remove(item);
    save(data ?? []);
  }
}

abstract class LocalStorageProxy<T> {
  final Future<SharedPreferences> _storage = SharedPreferences.getInstance();

  void save(List<T> list) async {
    final storage = await _storage;
    storage.getStringList('list')?.forEach((element) => Logs.log(element));
    await storage.setStringList(
      'list',
      list.map((e) => jsonEncode(e)).toList(),
    );
  }

  Future<List<T>?> load() async {
    final storage = await _storage;
    return storage
        .getStringList('list')
        ?.map((e) => Chore.fromJson(jsonDecode(e)) as T) // TODO: fix
        .toList();
  }
}
