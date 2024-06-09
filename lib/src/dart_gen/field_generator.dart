import 'package:dart_wsdl_gen/src/common/common.dart';
import 'package:dart_wsdl_gen/src/dart_gen/dart_utils.dart';

String generateDartField(String fieldName, String fieldType, bool includeJson,
    {String? docstring}) {
  var jsonAnnotation = includeJson ? "@JsonKey(name: '$fieldName')\n" : "";
  return "${docstring != null ? "$docstring\n" : ""}${jsonAnnotation}final ${stripIllegal(convertXsdTypeToDartType(fieldType), firstCharCapital: true)} ${stripIllegal(fieldName)};";
}

String generateDartConstructorField(String name, String type, bool isNullable,
        {bool isSuperField = false}) =>
    "    ${isNullable ? "" : "required "}${isSuperField ? "super" : "this"}.${stripIllegal(name)},";
