import 'dart:io';

import 'package:args/args.dart';
import 'package:dart_wsdl_gen/src/xsd_gen/wsdl_generator.dart';
import 'package:dart_wsdl_gen/src/xsd_gen/xsd_generator.dart';
import 'package:xml/xml.dart';

const String version = '0.0.1';
const String onvifFolder = "lib/onvif_gen";

void printUsage(ArgParser argParser) {
  print('Usage: dart dart_wsdl_gen.dart <flags> [arguments]');
  print(argParser.usage);
}

void main(List<String> arguments) async {
  try {
    final List<File> xsdFiles = Directory("./xsd")
        .listSync(recursive: false)
        .where((element) => element.path.endsWith(".xsd"))
        .map((e) => File(e.path))
        .toList();

    final List<File> wsdlFiles = Directory("./wsdl")
        .listSync(recursive: false)
        .where((element) => element.path.endsWith(".wsdl.xml"))
        .map((e) => File(e.path))
        .toList();

    for (var xsdFile in xsdFiles) {
      var xmlString = xsdFile.readAsStringSync();
      var xmlDocument = XmlDocument.parse(xmlString);

      var fileName = xsdFile.path.split("\\").last.split(".").first;
      var dirToCreate = "$onvifFolder/xsd_dart/$fileName";
      Directory(dirToCreate).createSync(recursive: true);
      generateXsd(xmlDocument, "$dirToCreate/$fileName.dart", fileName);
    }

    generateLibraryFile(
        "$onvifFolder/xsd_dart/lib.dart",
        xsdFiles
            .map((e) => e.path.split("\\").last.split(".").first)
            .map((e) => "$e/$e.dart")
            .toList());

    for (var wsdlFile in wsdlFiles) {
      var xmlString = wsdlFile.readAsStringSync();
      var xmlDocument = XmlDocument.parse(xmlString);

      var fileName = wsdlFile.path.split("\\").last.split(".").first;
      var dirToCreate = "$onvifFolder/wsdl_dart/$fileName";
      Directory(dirToCreate).createSync(recursive: true);
      generateWsdl(xmlDocument, "$dirToCreate/$fileName.dart", fileName);
    }
  } catch (e) {
    // Print usage information if an invalid argument was provided.
    print(e);
  }
}

void generateLibraryFile(String filePath, List<String> exports) {
  var file = File(filePath);
  var fileBuf = StringBuffer();
  fileBuf.writeln("/// GENERATED BY DART-XSD-GEN");

  for (var import in exports) {
    fileBuf.writeln("export '$import';");
  }

  file.writeAsStringSync(fileBuf.toString());
}
