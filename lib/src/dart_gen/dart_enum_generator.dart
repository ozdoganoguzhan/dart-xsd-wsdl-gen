import 'package:dart_wsdl_gen/src/dart_gen/dart_utils.dart';
import 'package:dart_wsdl_gen/src/dart_gen/doc_generator.dart';

String generateDartEnum(String name, List<String> values, {String? docstring}) {
  var enumBuf = StringBuffer();
  if (docstring != null) {
    enumBuf.writeln(generateDocstring(docstring));
  }
  enumBuf.writeln("enum $name {");
  for (var value in values) {
    enumBuf.writeln("  @JsonValue(\"$value\")");
    enumBuf.writeln("  ${stripIllegal(value, firstCharCapital: true)},");
  }
  enumBuf.writeln("}");
  return enumBuf.toString();
}
