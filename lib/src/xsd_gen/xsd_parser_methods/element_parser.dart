import 'package:dart_wsdl_gen/src/common/common.dart';
import 'package:dart_wsdl_gen/src/dart_gen/dart_class_generator.dart';
import 'package:dart_wsdl_gen/src/xsd_gen/types.dart';
import 'package:dart_wsdl_gen/src/xsd_gen/xsd_parser_methods/docstring_parser.dart';
import 'package:xml/xml.dart';

String? parseElement(
    XmlElement xmlElement, Map<String, List<Field>> generatedTypes) {
  if (xmlElement.children.isEmpty) return null;
  var elementBuf = StringBuffer();
  var namespace = getElementNamespacePrefix(xmlElement);
  var elementName = xmlElement.getAttribute("name");
  var extension =
      xmlElement.findAllElements("${namespace}extension").firstOrNull;
  if (elementName == null) return null;
  var sequence = xmlElement.findAllElements("${namespace}sequence").firstOrNull;

  if (xmlElement.findElements("${namespace}annotation").isNotEmpty) {
    elementBuf.writeln(parseXsdDocstring(xmlElement));
  }

  List<Field> complexTypeFields = [];

  if (sequence != null) {
    var elementFields = parseFieldsFromXsdElement(
      sequence,
      namespace: namespace,
      tagName: "element",
    );
    complexTypeFields.addAll(elementFields);
  }

  var attributeFields = parseFieldsFromXsdElement(
    xmlElement,
    namespace: namespace,
    tagName: "attribute",
  );
  complexTypeFields.addAll(attributeFields);
  var complexTypeCls = "";
  var complexTypeSuperFields = <Field>[];
  if (extension != null) {
    var baseCls = extension.getAttribute("base")?.split(":").last;
    if (baseCls != null) {
      if (generatedTypes.containsKey(baseCls)) {
        var baseFields = generatedTypes[baseCls];
        if (baseFields != null) {
          complexTypeSuperFields.addAll(baseFields);
          complexTypeCls = generateDartClass(
            elementName,
            complexTypeFields,
            false,
            extendsClass: baseCls,
            superFields: complexTypeSuperFields,
          );
        }
      } else if (extension.parentElement!.localName.contains("simpleContent")) {
        var simpleBaseType = extension.getAttribute("base")?.split(":").last;
        complexTypeFields
            .add(Field("value", simpleBaseType ?? "String", false, null));
        var innerAttributeFields = parseFieldsFromXsdElement(
          extension,
          namespace: namespace,
          tagName: "attribute",
        );
        complexTypeFields.addAll(innerAttributeFields);
        complexTypeCls = generateDartClass(
          elementName,
          complexTypeFields,
          false,
        );
      }
    }
  } else {
    complexTypeCls = generateDartClass(elementName, complexTypeFields, false);
  }
  if (!generatedTypes.containsKey(elementName)) {
    generatedTypes.addAll({elementName: complexTypeFields});
  }
  elementBuf.write(complexTypeCls);
  return elementBuf.toString();
}
