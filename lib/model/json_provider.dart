class JsonProvider {
  JsonProvider._internal(): values = {};
  static final JsonProvider _singleton = JsonProvider._internal();
  factory JsonProvider() {
    return _singleton;
  }

  final Map<String, String> values;
}