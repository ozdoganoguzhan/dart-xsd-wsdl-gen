import 'package:dart_wsdl_gen/src/common/common.dart';
import 'package:dart_wsdl_gen/src/dart_gen/doc_generator.dart';
import 'package:xml/xml.dart';

String? parseXsdDocstring(XmlElement element) {
  var namespace = getElementNamespacePrefix(element);
  var annotation = element.findElements("${namespace}annotation").firstOrNull;
  if (annotation != null) {
    var doc = annotation.findElements("${namespace}documentation").firstOrNull;
    if (doc != null) {
      return generateDocstring(doc.innerText);
    }
  }
  return null;
}
