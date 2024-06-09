import 'package:dart_wsdl_gen/src/common/common.dart';
import 'package:dart_wsdl_gen/src/dart_gen/dart_class_generator.dart';
import 'package:dart_wsdl_gen/src/dart_gen/dart_enum_generator.dart';
import 'package:dart_wsdl_gen/src/xsd_gen/types.dart';
import 'package:dart_wsdl_gen/src/xsd_gen/xsd_parser_methods/docstring_parser.dart';
import 'package:xml/xml.dart';

String? parseSimpleType(XmlElement xmlElement) {
  var simpleTypeBuf = StringBuffer();
  var simpleTypeName = xmlElement.getAttribute("name");
  if (simpleTypeName == null) return "";
  var namespace = getElementNamespacePrefix(xmlElement);
  var restriction =
      xmlElement.findElements("${namespace}restriction").firstOrNull;

  if (xmlElement.findElements("${namespace}annotation").isNotEmpty) {
    simpleTypeBuf.writeln(parseXsdDocstring(xmlElement));
  }

  if (restriction != null) {
    var base = restriction.getAttribute("base")?.split(":").last;
    var enums = restriction.findElements("${namespace}enumeration");
    if (enums.isNotEmpty) {
      var enumValues = enums
          .map((e) => e.getAttribute("value"))
          .where((element) => element != null && element.isNotEmpty)
          .map((e) => e!)
          .toList();
      simpleTypeBuf.write(generateDartEnum(simpleTypeName, enumValues));
      return simpleTypeBuf.toString();
    }

    if (base != null) {
      simpleTypeBuf.write(generateDartClass(simpleTypeName,
          [Field("val", convertXsdTypeToDartType(base), false, null)], false));
    }
  }

  var list = xmlElement.findElements("${namespace}list").firstOrNull;

  // Typedefs for list types
  if (list != null) {
    var itemType = list.getAttribute("itemType")?.split(":").last;
    if (itemType == null) return "";
    simpleTypeBuf.write(
        "typedef $simpleTypeName = List<${convertXsdTypeToDartType(itemType)}>;\n");
  }

  return simpleTypeBuf.toString();
}
