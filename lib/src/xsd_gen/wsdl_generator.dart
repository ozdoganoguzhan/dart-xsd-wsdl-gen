import 'dart:io';

import 'package:dart_wsdl_gen/src/common/common.dart';
import 'package:dart_wsdl_gen/src/xsd_gen/types.dart';
import 'package:xml/xml.dart';

Map<String, List<Field>> _generatedSchemaTypes = {};

/// Maps message names to their generated class names. Keys are message names.
Map<String, String> _messageToType = {};

void generateWsdl(XmlDocument xmlDocument, String filePath, String fileName) {
  var schemaElement = xmlDocument
      .findAllElements("schema", namespace: "http://www.w3.org/2001/XMLSchema")
      .firstOrNull;

  if (schemaElement == null) {
    print("No schema found");
    return;
  }
  var namespace = getElementNamespacePrefix(schemaElement);
  var file = File(filePath);
  var fileBuf = StringBuffer();

  fileBuf.writeln("/// GENERATED BY OZIBABA");
  fileBuf.writeln("import 'dart:typed_data';");
  fileBuf.write("import 'package:json_annotation/json_annotation.dart';\n\n");

  if (schemaElement
      .findElements('${namespace}import')
      .any((e) => e.getAttribute('schemaLocation')!.contains('onvif'))) {
    fileBuf
        .writeln("import 'package:dart_wsdl_gen/onvif_gen/xsd_dart/lib.dart';");
  }

  schemaElement.childElements
      .map((e) => parseSchemaElement(e, _generatedSchemaTypes))
      .forEach((e) {
    if (e != null) {
      fileBuf.writeln(e);
    }
  });

  _messageToType.addAll(
      parseWsdlMessages(xmlDocument.findElements("wsdl:definitions").first));

  var portType = xmlDocument.findElements("wsdl:portType").firstOrNull;

  if (portType != null) {}

  file.writeAsStringSync(fileBuf.toString());
}

Map<String, String> parseWsdlMessages(
  XmlElement xmlElement, {
  String namespace = "wsdl:",
}) {
  Map<String, String> messageToType = {};
  for (var message in xmlElement.findElements('${namespace}message')) {
    var messageName = message.getAttribute('name');
    var parts = message.findElements('${namespace}part');
    for (var part in parts) {
      var partName = part.getAttribute('name');
      var partType = part.getAttribute('element')?.split(':').last ??
          part.getAttribute('type')?.split(':').last;
      if (partType != null) {
        messageToType[messageName!] = partType;
      }
    }
  }
  return messageToType;
}

// String parseWsdlOperation(XmlElement operationElement) {
//   var operationBuf = StringBuffer();
//   var operationName = operationElement.getAttribute("name");
//   var input = operationElement.findElements("wsdl:input").firstOrNull;
//   var output = operationElement.findElements("wsdl:output").firstOrNull;
//   var inputMessage = input?.getAttribute("message")?.split(":").last;
//   var outputMessage = output?.getAttribute("message")?.split(":").last;
//   var inputType = _messageToType[inputMessage];
//   var outputType = _messageToType[outputMessage];
//   print("Operation: $operationName");
//   print("Input: $inputType");
//   print("Output: $outputType");
// }

// String dartFunctionGenerator() {}

// class DartFunction {
//   String name;
//   String returnType;
//   List<FunctionParameter> parameters;

//   DartFunction(this.name, this.returnType, this.parameters);
// }

// class FunctionParameter {
//   String name;
//   String type;
//   bool isRequired;
//   String? defaultValue;

//   FunctionParameter(this.name, this.type, this.isRequired, this.defaultValue);
// }
