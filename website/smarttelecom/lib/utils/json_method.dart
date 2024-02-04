class JsonUtils {
  static Map<String, dynamic> cleanJson(Map<String, dynamic> classJson) {
    classJson.removeWhere((_, dynamic value) => value == null);
    return classJson;
  }
}
