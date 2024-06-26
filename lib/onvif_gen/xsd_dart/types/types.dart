/// GENERATED BY OZIBABA
import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';

/// Type used to reference logical and physical entities.
@JsonSerializable()
class ReferenceToken  {
  @JsonKey(name: 'val')
final String val;
  ReferenceToken({
        required this.val,
  });
}

/// General datastructure referenced by a token.
/// Should be used as extension base.
/// 
@JsonSerializable()
class DataEntity  {
  /// A service-unique identifier of the item.
@JsonKey(name: 'token')
final ReferenceToken token;
  DataEntity({
        required this.token,
  });
}

/// Type used for names of logical and physical entities.
@JsonSerializable()
class Name  {
  @JsonKey(name: 'val')
final String val;
  Name({
        required this.val,
  });
}

/// Description is optional and the maximum length is device specific.
/// If the length is more than maximum length, it is silently chopped to the maximum length
/// supported by the device/service (which may be 0).
/// 
@JsonSerializable()
class Description  {
  @JsonKey(name: 'val')
final String val;
  Description({
        required this.val,
  });
}

/// Type used to represent the numbers from 1 ,2 , 3,...
@JsonSerializable()
class PositiveInteger  {
  @JsonKey(name: 'val')
final int val;
  PositiveInteger({
        required this.val,
  });
}

/// 
/// Attributes contains a Name and an optional Value and type.
/// 
@JsonSerializable()
class Attribute  {
  /// Name of attribute. Key names starting with "ONVIF" (any case) are reserved for ONVIF
/// use.
/// 
@JsonKey(name: 'Name')
final String name;
  /// Value of attribute
@JsonKey(name: 'Value')
final String value;
  Attribute({
        required this.name,
        required this.value,
  });
}

