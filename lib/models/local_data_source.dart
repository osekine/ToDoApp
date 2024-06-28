part of 'i_data_source.dart';

class LocalDataSource<T> extends LocalStorageProxy<T>
    implements IDataSource<T> {
  @override
  List<T>? data;

  @override
  int revision = 0;

  @override
  void add(T item) {
    data = [item, ...data ?? []];
    sync();
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
    final loadedData = await load();
    revision = loadedData.$1 ?? 0;
    Logs.log('Local rev: $revision');
    data = loadedData.$2;
    return loadedData.$2;
  }

  @override
  void remove(T item) {
    data?.remove(item);
    sync();
  }

  @override
  void sync() {
    Logs.log('LOCAL Syncing...');
    revision = revision + 1;
    save(data ?? [], revision);
  }
}

abstract class LocalStorageProxy<T> {
  final Future<SharedPreferences> _storage = SharedPreferences.getInstance();

  void save(List<T> list, int revision) async {
    Logs.log('LOCAL Saving...');
    final storage = await _storage;
    await storage.setStringList(
      'list',
      list.map((e) => jsonEncode(e)).toList(),
    );
    await storage.setInt('revision', revision);
  }

  Future<(int?, List<T>?)> load() async {
    Logs.log('LOCAL Loading...');
    final storage = await _storage;
    return (
      storage.getInt('revision'),
      storage
          .getStringList('list')
          ?.map((e) => Chore.fromJson(jsonDecode(e)) as T) // TODO: fix
          .toList()
    );
  }
}
