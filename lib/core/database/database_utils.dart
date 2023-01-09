class DatabaseUtils {
  /// return true if s1 == s2
  static bool schemaCompare(String? s1, String? s2,
      {List<String> exclude = const ["IFNOTEXISTS"]}) {
    if (s1 == null || s2 == null) return false;
    Pattern regex1 = RegExp(
      r"\p{P}",
      unicode: true,
    );
    Pattern regex2 = RegExp(r"\s+\b|\b\s");
    String raw1 = s1.replaceAll(regex1, "");
    raw1 = raw1.replaceAll(regex2, "").replaceAll("\n", " ");
    String raw2 = s2.replaceAll(regex1, "");
    raw2 = raw2.replaceAll(regex2, "").replaceAll("\n", " ");
    for (var e in exclude) {
      raw1 = raw1.replaceAll(e, "");
      raw2 = raw2.replaceAll(e, "");
    }
    return raw1.trim() == raw2.trim();
  }

  
}
