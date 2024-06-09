/// GENERATED BY OZIBABA
import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';

import 'package:dart_wsdl_gen/onvif_gen/xsd_dart/lib.dart';

class GetServiceCapabilities {}

@JsonSerializable()
class GetServiceCapabilitiesResponse {
  /// The capabilities for the imaging service is returned in the Capabilities element.
  @JsonKey(name: 'Capabilities')
  final Capabilities capabilities;
  GetServiceCapabilitiesResponse({
    required this.capabilities,
  });
}

@JsonSerializable()
class Capabilities {
  /// Indicates whether or not Image Stabilization feature is supported.
  /// The use of this capability is deprecated, a client should use GetOption to find out if image stabilization is supported.
  @JsonKey(name: 'ImageStabilization')
  final bool imageStabilization;

  /// Indicates whether or not Imaging Presets feature is supported.
  @JsonKey(name: 'Presets')
  final bool presets;

  /// Indicates whether or not imaging preset settings can be updated.
  @JsonKey(name: 'AdaptablePreset')
  final bool adaptablePreset;
  Capabilities({
    required this.imageStabilization,
    required this.presets,
    required this.adaptablePreset,
  });
}

@JsonSerializable()
class GetImagingSettings {
  ///
  /// Reference token to the VideoSource for which the ImagingSettings.
  ///
  @JsonKey(name: 'VideoSourceToken')
  final ReferenceToken videoSourceToken;
  GetImagingSettings({
    required this.videoSourceToken,
  });
}

@JsonSerializable()
class GetImagingSettingsResponse {
  ///
  /// ImagingSettings for the VideoSource that was requested.
  ///
  @JsonKey(name: 'ImagingSettings')
  final ImagingSettings20 imagingSettings;
  GetImagingSettingsResponse({
    required this.imagingSettings,
  });
}

@JsonSerializable()
class SetImagingSettings {
  @JsonKey(name: 'VideoSourceToken')
  final ReferenceToken videoSourceToken;
  @JsonKey(name: 'ImagingSettings')
  final ImagingSettings20 imagingSettings;
  @JsonKey(name: 'ForcePersistence')
  final bool? forcePersistence;
  SetImagingSettings({
    required this.videoSourceToken,
    required this.imagingSettings,
    this.forcePersistence,
  });
}

class SetImagingSettingsResponse {}

@JsonSerializable()
class GetOptions {
  ///
  /// Reference token to the VideoSource for which the imaging parameter options are requested.
  ///
  @JsonKey(name: 'VideoSourceToken')
  final ReferenceToken videoSourceToken;
  GetOptions({
    required this.videoSourceToken,
  });
}

@JsonSerializable()
class GetOptionsResponse {
  ///
  /// Valid ranges for the imaging parameters that are categorized as device specific.
  ///
  @JsonKey(name: 'ImagingOptions')
  final ImagingOptions20 imagingOptions;
  GetOptionsResponse({
    required this.imagingOptions,
  });
}

@JsonSerializable()
class Move {
  ///
  /// Reference to the VideoSource for the requested move (focus) operation.
  ///
  @JsonKey(name: 'VideoSourceToken')
  final ReferenceToken videoSourceToken;

  ///
  /// Content of the requested move (focus) operation.
  ///
  @JsonKey(name: 'Focus')
  final FocusMove focus;
  Move({
    required this.videoSourceToken,
    required this.focus,
  });
}

class MoveResponse {}

@JsonSerializable()
class GetMoveOptions {
  ///
  /// Reference token to the VideoSource for the requested move options.
  ///
  @JsonKey(name: 'VideoSourceToken')
  final ReferenceToken videoSourceToken;
  GetMoveOptions({
    required this.videoSourceToken,
  });
}

@JsonSerializable()
class GetMoveOptionsResponse {
  ///
  /// Valid ranges for the focus lens move options.
  ///
  @JsonKey(name: 'MoveOptions')
  final MoveOptions20 moveOptions;
  GetMoveOptionsResponse({
    required this.moveOptions,
  });
}

@JsonSerializable()
class Stop {
  ///
  /// Reference token to the VideoSource where the focus movement should be stopped.
  ///
  @JsonKey(name: 'VideoSourceToken')
  final ReferenceToken videoSourceToken;
  Stop({
    required this.videoSourceToken,
  });
}

class StopResponse {}

@JsonSerializable()
class GetStatus {
  ///
  /// Reference token to the VideoSource where the imaging status should be requested.
  ///
  @JsonKey(name: 'VideoSourceToken')
  final ReferenceToken videoSourceToken;
  GetStatus({
    required this.videoSourceToken,
  });
}

@JsonSerializable()
class GetStatusResponse {
  ///
  /// Requested imaging status.
  ///
  @JsonKey(name: 'Status')
  final ImagingStatus20 status;
  GetStatusResponse({
    required this.status,
  });
}

/// Describes standard Imaging Preset types, used to facilitate Multi-language support and client display.
/// "Custom" Type shall be used when Imaging Preset Name does not match any of the types included in the standard classification.
///
enum ImagingPresetType {
  @JsonValue("Custom")
  Custom,
  @JsonValue("ClearWeather")
  ClearWeather,
  @JsonValue("Cloudy")
  Cloudy,
  @JsonValue("Fog")
  Fog,
  @JsonValue("Rain")
  Rain,
  @JsonValue("Snowing")
  Snowing,
  @JsonValue("Snow")
  Snow,
  @JsonValue("WDR")
  WDR,
  @JsonValue("Shade")
  Shade,
  @JsonValue("Night")
  Night,
  @JsonValue("Indoor")
  Indoor,
  @JsonValue("Fluorescent")
  Fluorescent,
  @JsonValue("Incandescent")
  Incandescent,
  @JsonValue("Sodium(Natrium)")
  SodiumNatrium,
  @JsonValue("Sunrise(Horizon)")
  SunriseHorizon,
  @JsonValue("Sunset(Rear)")
  SunsetRear,
  @JsonValue("ExtremeHot")
  ExtremeHot,
  @JsonValue("ExtremeCold")
  ExtremeCold,
  @JsonValue("Underwater")
  Underwater,
  @JsonValue("CloseUp")
  CloseUp,
  @JsonValue("Motion")
  Motion,
  @JsonValue("FlickerFree50")
  FlickerFree50,
  @JsonValue("FlickerFree60")
  FlickerFree60,
}

/// Type describing the Imaging Preset settings.
@JsonSerializable()
class ImagingPreset {
  /// Human readable name of the Imaging Preset.
  @JsonKey(name: 'Name')
  final String name;

  /// Unique identifier of this Imaging Preset.
  @JsonKey(name: 'token')
  final ReferenceToken token;

  /// Indicates Imaging Preset Type. Use timg:ImagingPresetType.
  /// Used for multi-language support and display.
  @JsonKey(name: 'type')
  final String type;
  ImagingPreset({
    required this.name,
    required this.token,
    required this.type,
  });
}

@JsonSerializable()
class GetPresets {
  ///
  /// A reference to the VideoSource where the operation should take place.
  ///
  @JsonKey(name: 'VideoSourceToken')
  final ReferenceToken videoSourceToken;
  GetPresets({
    required this.videoSourceToken,
  });
}

@JsonSerializable()
class GetPresetsResponse {
  ///
  /// List of Imaging Presets which are available for the requested VideoSource.
  ///
  @JsonKey(name: 'Preset')
  final ImagingPreset preset;
  GetPresetsResponse({
    required this.preset,
  });
}

@JsonSerializable()
class GetCurrentPreset {
  ///  Reference token to the VideoSource where the current Imaging Preset should be requested.
  @JsonKey(name: 'VideoSourceToken')
  final ReferenceToken videoSourceToken;
  GetCurrentPreset({
    required this.videoSourceToken,
  });
}

@JsonSerializable()
class GetCurrentPresetResponse {
  ///  Current Imaging Preset in use for the specified Video Source.
  @JsonKey(name: 'Preset')
  final ImagingPreset? preset;
  GetCurrentPresetResponse({
    this.preset,
  });
}

@JsonSerializable()
class SetCurrentPreset {
  ///
  /// Reference token to the VideoSource to which the specified Imaging Preset should be applied.
  ///
  @JsonKey(name: 'VideoSourceToken')
  final ReferenceToken videoSourceToken;

  ///  Reference token to the Imaging Preset to be applied to the specified Video Source.
  @JsonKey(name: 'PresetToken')
  final ReferenceToken presetToken;
  SetCurrentPreset({
    required this.videoSourceToken,
    required this.presetToken,
  });
}

class SetCurrentPresetResponse {}
