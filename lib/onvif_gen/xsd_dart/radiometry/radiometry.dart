import '../onvif/onvif.dart';
/// GENERATED BY OZIBABA
import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RadiometryModuleConfigOptions  {
  /// 
///                     The total number of temperature measurement modules that can be created on the
///                     device, screen based or geolocated, of any type (spots or boxes).
///                 
@JsonKey(name: 'MaxMeasurementModules')
final int maxMeasurementModules;
  /// 
///                     The total number of spot measurement modules that can be loaded simultaneously on the
///                     screen by the device. A value of 0 shall be used to indicate no support for Spots.
///                 
@JsonKey(name: 'MaxScreenSpots')
final int maxScreenSpots;
  /// 
///                     The total number of box measurement modules that can be loaded simultaneously on the
///                     screen by the device. A value of 0 shall be used to indicate no support for Boxes.
///                 
@JsonKey(name: 'MaxScreenBoxes')
final int maxScreenBoxes;
  /// 
/// Specifies valid ranges for the different radiometry parameters used for temperature calculation.
/// 
@JsonKey(name: 'RadiometryParameterOptions')
final RadiometryParameterOptions? radiometryParameterOptions;
  RadiometryModuleConfigOptions({
        required this.maxMeasurementModules,
        required this.maxScreenSpots,
        required this.maxScreenBoxes,
        this.radiometryParameterOptions,
  });
}

/// 
/// Describes valid ranges for the different radiometry parameters used for accurate temperature calculation. 
/// 
@JsonSerializable()
class RadiometryParameterOptions  {
  /// Valid range of temperature values, in Kelvin.
@JsonKey(name: 'ReflectedAmbientTemperature')
final FloatRange? reflectedAmbientTemperature;
  /// Valid range of emissivity values for the objects to measure.
@JsonKey(name: 'Emissivity')
final FloatRange? emissivity;
  /// Valid range of distance between camera and object for a valid temperature reading, in meters.
@JsonKey(name: 'DistanceToObject')
final FloatRange? distanceToObject;
  /// Valid range of relative humidity values, in percentage.
@JsonKey(name: 'RelativeHumidity')
final FloatRange? relativeHumidity;
  /// Valid range of temperature values, in Kelvin.
@JsonKey(name: 'AtmosphericTemperature')
final FloatRange? atmosphericTemperature;
  /// Valid range of atmospheric transmittance values.
@JsonKey(name: 'AtmosphericTransmittance')
final FloatRange? atmosphericTransmittance;
  /// Valid range of temperature values, in Kelvin.
@JsonKey(name: 'ExtOpticsTemperature')
final FloatRange? extOpticsTemperature;
  /// Valid range of external optics transmittance.
@JsonKey(name: 'ExtOpticsTransmittance')
final FloatRange? extOpticsTransmittance;
  RadiometryParameterOptions({
        this.reflectedAmbientTemperature,
        this.emissivity,
        this.distanceToObject,
        this.relativeHumidity,
        this.atmosphericTemperature,
        this.atmosphericTransmittance,
        this.extOpticsTemperature,
        this.extOpticsTransmittance,
  });
}

@JsonSerializable()
class RadiometrySpotModuleConfig  {
  /// 
/// Screen coordinates, if spot is currently on screen. Assumes normalized screen limits (-1.0, 1.0).
/// 
@JsonKey(name: 'ScreenCoords')
final Vector screenCoords;
  /// 
/// Absolute orientation of the PTZ Vector with the Spot on screen. If no PTZVector is present 
/// the spot shall behave as a screen element, and stay on the same screen coordinates as the PTZ 
/// moves (like a head up display mask). If PTZVector is present the Spot element shall appear on
/// display only when contained in the Field of View. In this case SpotScreenCoords shall be 
/// reported as relative to PTZVector.
/// 
@JsonKey(name: 'AbsoluteCoords')
final PTZVector? absoluteCoords;
  /// 
/// Not present parameter means the Device shall use its value from Global Parameters in Thermal Service.
/// 
@JsonKey(name: 'RadiometryParameters')
final RadiometryParameters? radiometryParameters;
  /// 
/// Unique identifier for this Spot Temperature Measurement Analytics Module.
/// 
@JsonKey(name: 'ItemID')
final ReferenceToken itemID;
  /// 
/// Indicates if the Temperature Measurement Item is enabled to provide temperature readings.
/// 
@JsonKey(name: 'Active')
final bool active;
  RadiometrySpotModuleConfig({
        required this.screenCoords,
        this.absoluteCoords,
        this.radiometryParameters,
        required this.itemID,
        required this.active,
  });
}

@JsonSerializable()
class RadiometryBoxModuleConfig  {
  /// 
/// Screen coordinates, if box is currently on screen. Assumes normalized screen limits (-1.0, 1.0).
/// 
@JsonKey(name: 'ScreenCoords')
final Rectangle screenCoords;
  /// 
/// Absolute orientation of the PTZ Vector with the Box on screen. If no PTZVector is present 
/// the box shall behave as a screen element, and stay on the same screen coordinates as the PTZ 
/// moves (like a head up display mask). If PTZVector is present the Box element shall appear on
/// display only when contained in the Field of View. In this case BoxScreenCoords shall be 
/// reported as relative to PTZVector.
/// 
@JsonKey(name: 'AbsoluteCoords')
final PTZVector? absoluteCoords;
  /// 
/// Not present parameter means the Device shall use its value from Global Parameters in Thermal Service.
/// 
@JsonKey(name: 'RadiometryParameters')
final RadiometryParameters? radiometryParameters;
  /// 
/// Unique identifier for this Box Temperature Measurement Analytics Module.
/// 
@JsonKey(name: 'ItemID')
final ReferenceToken itemID;
  /// 
/// Indicates if the Temperature Measurement Item is enabled to provide temperature readings.
/// 
@JsonKey(name: 'Active')
final bool active;
  RadiometryBoxModuleConfig({
        required this.screenCoords,
        this.absoluteCoords,
        this.radiometryParameters,
        required this.itemID,
        required this.active,
  });
}

@JsonSerializable()
class SpotTemperatureReading  {
  /// 
///                 Not present means Global Parameters from Thermal Service are being used. 
///             
@JsonKey(name: 'RadiometryParameters')
final RadiometryParameters? radiometryParameters;
  @JsonKey(name: 'ItemID')
final ReferenceToken itemID;
  @JsonKey(name: 'SpotTemperature')
final double spotTemperature;
  SpotTemperatureReading({
        this.radiometryParameters,
        required this.itemID,
        required this.spotTemperature,
  });
}

@JsonSerializable()
class BoxTemperatureReading  {
  /// 
///                 Not present means Global Parameters from Thermal Service are being used. 
///             
@JsonKey(name: 'RadiometryParameters')
final RadiometryParameters? radiometryParameters;
  @JsonKey(name: 'ItemID')
final ReferenceToken itemID;
  @JsonKey(name: 'MaxTemperature')
final double maxTemperature;
  @JsonKey(name: 'MinTemperature')
final double minTemperature;
  @JsonKey(name: 'AverageTemperature')
final double averageTemperature;
  @JsonKey(name: 'MedianTemperature')
final double medianTemperature;
  BoxTemperatureReading({
        this.radiometryParameters,
        required this.itemID,
        required this.maxTemperature,
        required this.minTemperature,
        required this.averageTemperature,
        required this.medianTemperature,
  });
}

@JsonSerializable()
class RadiometryParameters  {
  @JsonKey(name: 'ReflectedAmbientTemperature')
final double? reflectedAmbientTemperature;
  @JsonKey(name: 'Emissivity')
final double? emissivity;
  @JsonKey(name: 'DistanceToObject')
final double? distanceToObject;
  @JsonKey(name: 'RelativeHumidity')
final double? relativeHumidity;
  @JsonKey(name: 'AtmosphericTemperature')
final double? atmosphericTemperature;
  @JsonKey(name: 'AtmosphericTransmittance')
final double? atmosphericTransmittance;
  @JsonKey(name: 'ExtOpticsTemperature')
final double? extOpticsTemperature;
  @JsonKey(name: 'ExtOpticsTransmittance')
final double? extOpticsTransmittance;
  RadiometryParameters({
        this.reflectedAmbientTemperature,
        this.emissivity,
        this.distanceToObject,
        this.relativeHumidity,
        this.atmosphericTemperature,
        this.atmosphericTransmittance,
        this.extOpticsTemperature,
        this.extOpticsTransmittance,
  });
}

@JsonSerializable()
class RadiometryRuleConfigOptions  {
  /// 
/// Specifies valid ranges for thresholds and reference parameters used for triggering radiometric rules.
/// 
@JsonKey(name: 'RadiometryRuleOptions')
final RadiometryRuleOptions? radiometryRuleOptions;
  /// 
/// Specifies valid rule conditions for temperature comparisions in radiometric rules.
/// 
@JsonKey(name: 'TemperatureConditionOptions')
final TemperatureCondition temperatureConditionOptions;
  /// 
/// Specifies temperature measurement types provided by radiometry analytics modules in the device.
/// 
@JsonKey(name: 'TemperatureTypeOptions')
final TemperatureType temperatureTypeOptions;
  RadiometryRuleConfigOptions({
        this.radiometryRuleOptions,
        required this.temperatureConditionOptions,
        required this.temperatureTypeOptions,
  });
}

/// 
/// Describes valid ranges for radiometric rule condition thresholds and reference parameters.  
/// 
@JsonSerializable()
class RadiometryRuleOptions  {
  /// Valid range of temperature values, in Kelvin.
@JsonKey(name: 'ThresholdTemperature')
final FloatRange thresholdTemperature;
  /// Valid range of hysteresis time interval for temperature conditions, in seconds.
@JsonKey(name: 'ThresholdTime')
final FloatRange? thresholdTime;
  /// Valid range of temperature hysteresis values, in Kelvin.
@JsonKey(name: 'HysteresisTemperature')
final FloatRange? hysteresisTemperature;
  RadiometryRuleOptions({
        required this.thresholdTemperature,
        this.thresholdTime,
        this.hysteresisTemperature,
  });
}

enum TemperatureCondition {
  @JsonValue("LessThan")
  LessThan,
  @JsonValue("MoreThan")
  MoreThan,
  @JsonValue("EqualTo")
  EqualTo,
  @JsonValue("Change")
  Change,
}

enum TemperatureType {
  @JsonValue("MaxTemp")
  MaxTemp,
  @JsonValue("MinTemp")
  MinTemp,
  @JsonValue("AverageTemp")
  AverageTemp,
  @JsonValue("StdDeviation")
  StdDeviation,
  @JsonValue("MedianTemp")
  MedianTemp,
  @JsonValue("ISOCoverage")
  ISOCoverage,
}

@JsonSerializable()
class RadiometryTemperatureRuleConfig  {
  /// 
/// Indicates which of the temperature values provided by the input Analytics Module
/// shall be used by the rule. In the case of Analytics Modules providing a single
/// Temperature Value (e.g. Spot) this parameter is ignored, and is therefore optional.
/// 
@JsonKey(name: 'TemperatureType')
final TemperatureType? temperatureType;
  /// 
/// Indicates the type of temperature condition to check.
/// 
@JsonKey(name: 'RuleCondition')
final TemperatureCondition ruleCondition;
  /// 
/// Indicates the temperature reference value the rule shall be checked against.
/// 
@JsonKey(name: 'ThresholdTemperature')
final double thresholdTemperature;
  /// 
/// Indicates the time interval during which the rule condition shall be met to trigger an event.
/// 
@JsonKey(name: 'ThresholdTime')
final Duration thresholdTime;
  /// 
/// Indicates the width in Kelvin of the temerature hysteresis band to be considered by the rule.
/// 
@JsonKey(name: 'HysteresisTemperature')
final double hysteresisTemperature;
  /// 
/// Reference Token to the Temperature Measurement Analytics Module providing the Temperature on which rule is defined.
/// 
@JsonKey(name: 'RadiometryModuleID')
final ReferenceToken radiometryModuleID;
  /// 
/// Indicates if the Temperature Rule is enabled to provide temperature alarm events.
/// 
@JsonKey(name: 'Enabled')
final bool enabled;
  RadiometryTemperatureRuleConfig({
        this.temperatureType,
        required this.ruleCondition,
        required this.thresholdTemperature,
        required this.thresholdTime,
        required this.hysteresisTemperature,
        required this.radiometryModuleID,
        required this.enabled,
  });
}

