import 'dart:io';
import 'package:dart_wsdl_gen/src/common/common.dart';
import 'package:dart_wsdl_gen/src/xsd_gen/types.dart';
import 'package:dart_wsdl_gen/src/xsd_gen/xsd_parser_methods/complex_type_parser.dart';
import 'package:dart_wsdl_gen/src/xsd_gen/xsd_parser_methods/simple_type_parser.dart';
import 'package:xml/xml.dart';

Map<String, List<Field>> _GENERATED_TYPES = {};

void generateXsd(XmlDocument xmlDocument, String filePath, String fileName) {
  var schemaElement = xmlDocument
      .findElements("schema", namespace: "http://www.w3.org/2001/XMLSchema")
      .firstOrNull;

  if (schemaElement == null) {
    print("No schema found");
    return;
  }
  var file = File(filePath);
  var fileBuf = StringBuffer();

  fileBuf.write(parseImports(schemaElement));

  fileBuf.writeln("/// GENERATED BY OZIBABA");
  fileBuf.writeln("import 'dart:typed_data';");
  fileBuf.write("import 'package:json_annotation/json_annotation.dart';\n\n");
  // fileBuf.write("part '$fileName.g.dart';\n\n");

  schemaElement.childElements
      .map((e) => parseSchemaElement(e, _GENERATED_TYPES))
      .forEach((e) {
    if (e != null) {
      fileBuf.writeln(e);
    }
  });

  file.writeAsStringSync(fileBuf.toString());
}

String parseImports(XmlElement schemaElement) {
  var fileBuf = StringBuffer();
  var namespace = getElementNamespacePrefix(schemaElement);
  for (var import in [
    ...schemaElement.findElements("${namespace}include"),
    ...schemaElement.findElements("${namespace}import")
  ]) {
    var importNamespace = import.getAttribute("schemaLocation");
    importNamespace ??= import.getAttribute("namespace");

    if (importNamespace != null) {
      var importFileName = importNamespace.split("/").last.split(".").first;
      fileBuf.writeln("import '../$importFileName/$importFileName.dart';");
    }
  }
  return fileBuf.toString();
}