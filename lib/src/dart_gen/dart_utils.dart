String stripIllegal(String name, {bool firstCharCapital = false}) {
  if (name.contains(":")) {
    name = name.split(":").last;
  }
  // write a regex to replace ., - and space with _
  var illegalChars = RegExp('[ .-]');
  name = name.replaceAll(illegalChars, "_");
  name = name.replaceAll("(", "");
  name = name.replaceAll(")", "");

  if (name.startsWith(RegExp(r'[0-9]'))) {
    name = "_$name";
  }
  name = name.trim();
  const keywords = [
    "abstract",
    "as",
    "assert",
    "async",
    "await",
    "break",
    "case",
    "catch",
    "class",
    "const",
    "continue",
    "covariant",
    "default",
    "deferred",
    "do",
    "dynamic",
    "else",
    "enum",
    "export",
    "extends",
    "extension",
    "external",
    "factory",
    "false",
    "final",
    "finally",
    "for",
    "Function",
    "get",
    "hide",
    "if",
    "implements",
    "import",
    "in",
    "interface",
    "is",
    "late",
    "library",
    "mixin",
    "new",
    "null",
    "on",
    "operator",
    "part",
    "rethrow",
    "return",
    "set",
    "show",
    "static",
    "super",
    "switch",
    "sync",
    "this",
    "throw",
    "true",
    "try",
    "typedef",
    "var",
    "void",
    "while",
    "with",
    "yield"
  ];
  if (keywords.contains(name.toLowerCase())) {
    name = "${name}_";
  }
  return firstCharCapital ? name : name.lowerFirstChar();
}

extension StringExtension on String {
  String lowerFirstChar() {
    return this[0].toLowerCase() + substring(1);
  }
}
