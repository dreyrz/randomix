mixin ListUtils {
  static List<dynamic>? guaranteeNotEmpty(List<dynamic> list) =>
      list.isEmpty ? null : list;
}
