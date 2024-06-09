import 'package:dart_wsdl_gen/src/common/common.dart';
import 'package:dart_wsdl_gen/src/dart_gen/dart_utils.dart';
import 'package:dart_wsdl_gen/src/dart_gen/doc_generator.dart';
import 'package:dart_wsdl_gen/src/dart_gen/field_generator.dart';
import 'package:dart_wsdl_gen/src/xsd_gen/types.dart';

String generateDartClass(String className, List<Field> fields, bool includeJson,
    {String? docstring,
    String? extendsClass,
    List<Field> superFields = const []}) {
  if (fields.isEmpty) {
    return "class $className {}";
  }
  var classBuf = StringBuffer();
  if (docstring != null) {
    classBuf.writeln(generateDocstring(docstring));
  }
  var legalName = stripIllegal(className, firstCharCapital: true);
  classBuf.writeln("@JsonSerializable()");
  classBuf.writeln(
      "class $legalName ${extendsClass != null ? "extends $extendsClass " : ""} {");

  var constructorBuf = StringBuffer();
  constructorBuf.write("  $legalName({\n");

  for (var i = 0; i < fields.length; i++) {
    var field = fields[i];
    if (superFields.any((element) => element.name == field.name)) {
      fields[i] = Field(
          "${field.name}_inner", field.type, field.isNullable, field.docString);
    }
  }

  for (var field in fields) {
    var isFieldNullable = field.type.endsWith("?");
    classBuf.write(
        "  ${generateDartField(field.name, field.type, true, docstring: field.docString)}\n");
    constructorBuf.write(
        "    ${generateDartConstructorField(field.name, field.type, isFieldNullable)}\n");
  }

  for (var field in superFields) {
    var isFieldNullable = field.type.endsWith("?");
    constructorBuf.write(
        "    ${generateDartConstructorField(field.name, field.type, isFieldNullable, isSuperField: true)}\n");
  }

  constructorBuf.write("  });\n");
  classBuf.write(constructorBuf.toString());
  if (includeJson) {
    classBuf.writeln(
        "  factory $legalName.fromJson(Map<String, dynamic> json) => _\$${legalName}FromJson(json);");

    classBuf.writeln(
        "  Map<String, dynamic> toJson() => _\$${legalName}ToJson(this);");
  }
  classBuf.writeln("}");
  return classBuf.toString();
}
