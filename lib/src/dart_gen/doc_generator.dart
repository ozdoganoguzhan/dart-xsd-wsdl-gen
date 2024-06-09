String generateDocstring(String doc) {
  // Write the regex to replace tabs and all other illegal characters
  var illegalChars = RegExp(r'[\t\r\f\v\b]');
  return "/// ${doc.replaceAll(illegalChars, "").replaceAll("\n", "\n/// ")}";
}
