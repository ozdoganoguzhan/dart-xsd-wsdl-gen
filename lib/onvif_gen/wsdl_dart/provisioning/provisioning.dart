/// GENERATED BY OZIBABA
import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';

import 'package:dart_wsdl_gen/onvif_gen/xsd_dart/lib.dart';
/// The direction for PanMove to move the device.
enum PanDirection {
  @JsonValue("Left")
  Left,
  @JsonValue("Right")
  Right,
}

/// The direction for TiltMove to move the device.
enum TiltDirection {
  @JsonValue("Up")
  Up,
  @JsonValue("Down")
  Down,
}

/// The direction for ZoomMove to change the focal length in relation to the video source.
enum ZoomDirection {
  @JsonValue("Wide")
  Wide,
  @JsonValue("Telephoto")
  Telephoto,
}

/// The direction for RollMove to move the device.
enum RollDirection {
  @JsonValue("Clockwise")
  Clockwise,
  @JsonValue("Counterclockwise")
  Counterclockwise,
  @JsonValue("Auto")
  Auto,
}

/// The direction for FocusMove to move the focal plane in relation to the video source.
enum FocusDirection {
  @JsonValue("Near")
  Near,
  @JsonValue("Far")
  Far,
  @JsonValue("Auto")
  Auto,
}

/// The quantity of movement events that have occured over the lifetime of the device.
@JsonSerializable()
class Usage  {
  /// The quantity of pan movement events over the life of the device.
@JsonKey(name: 'Pan')
final int? pan;
  /// The quantity of tilt movement events over the life of the device.
@JsonKey(name: 'Tilt')
final int? tilt;
  /// The quantity of zoom movement events over the life of the device.
@JsonKey(name: 'Zoom')
final int? zoom;
  /// The quantity of roll movement events over the life of the device.
@JsonKey(name: 'Roll')
final int? roll;
  /// The quantity of focus movement events over the life of the device.
@JsonKey(name: 'Focus')
final int? focus;
  Usage({
        this.pan,
        this.tilt,
        this.zoom,
        this.roll,
        this.focus,
  });
}

/// The provisioning capabilities of a video source on the device.
@JsonSerializable()
class SourceCapabilities  {
  /// Unique identifier of a video source.
@JsonKey(name: 'VideoSourceToken')
final ReferenceToken videoSourceToken;
  /// Lifetime limit of pan moves for this video source.  Presence of this attribute indicates support of pan move.
@JsonKey(name: 'MaximumPanMoves')
final int maximumPanMoves;
  /// Lifetime limit of tilt moves for this video source.  Presence of this attribute indicates support of tilt move.
@JsonKey(name: 'MaximumTiltMoves')
final int maximumTiltMoves;
  /// Lifetime limit of zoom moves for this video source.  Presence of this attribute indicates support of zoom move.
@JsonKey(name: 'MaximumZoomMoves')
final int maximumZoomMoves;
  /// Lifetime limit of roll moves for this video source.  Presence of this attribute indicates support of roll move.
@JsonKey(name: 'MaximumRollMoves')
final int maximumRollMoves;
  /// Indicates "auto" as a valid enum for Direction in RollMove.
@JsonKey(name: 'AutoLevel')
final bool autoLevel;
  /// Lifetime limit of focus moves for this video source.  Presence of this attribute indicates support of focus move.
@JsonKey(name: 'MaximumFocusMoves')
final int maximumFocusMoves;
  /// Indicates "auto" as a valid enum for Direction in FocusMove.
@JsonKey(name: 'AutoFocus')
final bool autoFocus;
  SourceCapabilities({
        required this.videoSourceToken,
        required this.maximumPanMoves,
        required this.maximumTiltMoves,
        required this.maximumZoomMoves,
        required this.maximumRollMoves,
        required this.autoLevel,
        required this.maximumFocusMoves,
        required this.autoFocus,
  });
}

/// The capabilities of Provisioning Service on the device.
@JsonSerializable()
class Capabilities  {
  /// Maximum time before stopping movement after a move operation.
@JsonKey(name: 'DefaultTimeout')
final Duration defaultTimeout;
  /// Capabilities per video source.
@JsonKey(name: 'Source')
final SourceCapabilities? source;
  Capabilities({
        required this.defaultTimeout,
        this.source,
  });
}

class GetServiceCapabilities {}
@JsonSerializable()
class GetServiceCapabilitiesResponse  {
  /// The capabilities for the provisioning service on this device.
@JsonKey(name: 'Capabilities')
final Capabilities capabilities;
  GetServiceCapabilitiesResponse({
        required this.capabilities,
  });
}

@JsonSerializable()
class PanMove  {
  /// The video source associated with the provisioning.
@JsonKey(name: 'VideoSource')
final ReferenceToken videoSource;
  /// "left" or "right".
@JsonKey(name: 'Direction')
final PanDirection direction;
  /// "Operation timeout, if less than default timeout.
@JsonKey(name: 'Timeout')
final Duration? timeout;
  PanMove({
        required this.videoSource,
        required this.direction,
        this.timeout,
  });
}

class PanMoveResponse {}
@JsonSerializable()
class TiltMove  {
  /// The video source associated with the provisioning.
@JsonKey(name: 'VideoSource')
final ReferenceToken videoSource;
  /// "up" or "down".
@JsonKey(name: 'Direction')
final TiltDirection direction;
  /// "Operation timeout, if less than default timeout.
@JsonKey(name: 'Timeout')
final Duration? timeout;
  TiltMove({
        required this.videoSource,
        required this.direction,
        this.timeout,
  });
}

class TiltMoveResponse {}
@JsonSerializable()
class ZoomMove  {
  /// The video source associated with the provisioning.
@JsonKey(name: 'VideoSource')
final ReferenceToken videoSource;
  /// "wide" or "telephoto".
@JsonKey(name: 'Direction')
final ZoomDirection direction;
  /// "Operation timeout, if less than default timeout.
@JsonKey(name: 'Timeout')
final Duration? timeout;
  ZoomMove({
        required this.videoSource,
        required this.direction,
        this.timeout,
  });
}

class ZoomMoveResponse {}
@JsonSerializable()
class RollMove  {
  /// The video source associated with the provisioning.
@JsonKey(name: 'VideoSource')
final ReferenceToken videoSource;
  /// "clockwise", "counterclockwise", or "auto".
@JsonKey(name: 'Direction')
final RollDirection direction;
  /// "Operation timeout, if less than default timeout.
@JsonKey(name: 'Timeout')
final Duration? timeout;
  RollMove({
        required this.videoSource,
        required this.direction,
        this.timeout,
  });
}

class RollMoveResponse {}
@JsonSerializable()
class FocusMove  {
  /// The video source associated with the provisioning.
@JsonKey(name: 'VideoSource')
final ReferenceToken videoSource;
  /// "near", "far", or "auto".
@JsonKey(name: 'Direction')
final FocusDirection direction;
  /// "Operation timeout, if less than default timeout.
@JsonKey(name: 'Timeout')
final Duration? timeout;
  FocusMove({
        required this.videoSource,
        required this.direction,
        this.timeout,
  });
}

class FocusMoveResponse {}
@JsonSerializable()
class Stop  {
  /// The video source associated with the provisioning.
@JsonKey(name: 'VideoSource')
final ReferenceToken videoSource;
  Stop({
        required this.videoSource,
  });
}

class StopResponse {}
@JsonSerializable()
class GetUsage  {
  /// The video source associated with the provisioning.
@JsonKey(name: 'VideoSource')
final ReferenceToken videoSource;
  GetUsage({
        required this.videoSource,
  });
}

@JsonSerializable()
class GetUsageResponse  {
  /// The set of lifetime usage values for the provisioning associated with the video source.
@JsonKey(name: 'Usage')
final Usage usage;
  GetUsageResponse({
        required this.usage,
  });
}

