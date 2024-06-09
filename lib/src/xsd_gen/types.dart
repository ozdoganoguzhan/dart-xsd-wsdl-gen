sealed class SchemaElementTypes {
  static const String ComplexType = "complexType";
  static const String SimpleType = "simpleType";
  static const String Element = "element";
}

class Field {
  final String name;
  final String type;
  final bool isNullable;
  final String? docString;

  Field(this.name, this.type, this.isNullable, this.docString);
}
