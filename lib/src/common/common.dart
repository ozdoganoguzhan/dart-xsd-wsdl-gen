import 'package:dart_wsdl_gen/src/xsd_gen/types.dart';
import 'package:dart_wsdl_gen/src/xsd_gen/xsd_parser_methods/complex_type_parser.dart';
import 'package:dart_wsdl_gen/src/xsd_gen/xsd_parser_methods/docstring_parser.dart';
import 'package:dart_wsdl_gen/src/xsd_gen/xsd_parser_methods/element_parser.dart';
import 'package:dart_wsdl_gen/src/xsd_gen/xsd_parser_methods/simple_type_parser.dart';
import 'package:xml/xml.dart';

String convertXsdTypeToDartType(String xsdType) {
  var isNullable = xsdType.endsWith("?");
  var safeType = xsdType.replaceAll("?", "");
  if (isNullable) {
    xsdType = xsdType.split("?").first;
  }
  var strToReturn = switch (safeType) {
    "string" => "String",
    "int" => "int",
    "integer" => "int",
    "boolean" => "bool",
    "dateTime" => "DateTime",
    "double" => "double",
    "decimal" => "double",
    "float" => "double",
    "base64Binary" => "Uint8List",
    "anyURI" => "String",
    "duration" => "Duration",
    "hexBinary" => "Uint8List",
    "token" => "String",
    "QName" => "String",
    "unsignedInt" => "int",
    "unsignedShort" => "int",
    "unsignedByte" => "int",
    "positiveInteger" => "int",
    "nonNegativeInteger" => "int",
    "nonPositiveInteger" => "int",
    "negativeInteger" => "int",
    "byte" => "int",
    "short" => "int",
    "long" => "int",
    "unsignedLong" => "int",
    "Name" => "String",
    "NCName" => "String",
    "ENTITY" => "String",
    "ID" => "String",
    "IDREF" => "String",
    "NMTOKEN" => "String",
    "NOTATION" => "String",
    "anyURI" => "String",
    "ENTITIES" => "List<String>",
    "IDREFS" => "List<String>",
    "NMTOKENS" => "List<String>",
    "language" => "String",
    _ => safeType
  };
  return isNullable ? "$strToReturn?" : strToReturn;
}

bool checkElementForNullable(XmlElement element) {
  return element.getAttribute("nillable") == "true" ||
      element.getAttribute("minOccurs") == "0" ||
      element.getAttribute("use") == "optional";
}

String getElementNamespacePrefix(XmlElement element) {
  return element.namespacePrefix != null ? "${element.namespacePrefix}:" : "";
}

List<Field> parseFieldsFromXsdElement(XmlElement element,
    {String? namespace, String? tagName = "element"}) {
  var ns = namespace ?? getElementNamespacePrefix(element);
  var innerAttributes = element.findElements("${ns}${tagName}");
  return innerAttributes
      .where((element) =>
          element.getAttribute("name") != null &&
          element.getAttribute("type") != null)
      .map((attr) {
    var attrName = attr.getAttribute("name")!;
    var attrType = attr.getAttribute("type")!.split(":").last;
    var isNullable = checkElementForNullable(attr);
    if (isNullable) {
      attrType += "?";
    }
    var docString = parseXsdDocstring(attr);
    return Field(attrName, attrType, isNullable, docString);
  }).toList();
}

String? parseSchemaElement(
    XmlElement element, Map<String, List<Field>> generatedTypes) {
  var name = element.getAttribute("name");
  if (name == null) return null;

  return switch (element.name.local) {
    SchemaElementTypes.SimpleType => parseSimpleType(element),
    SchemaElementTypes.ComplexType => parseComplexType(element, generatedTypes),
    SchemaElementTypes.Element => parseElement(element, generatedTypes),
    _ => null
  };
}
