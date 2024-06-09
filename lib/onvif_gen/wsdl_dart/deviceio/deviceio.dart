/// GENERATED BY OZIBABA
import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';

import 'package:dart_wsdl_gen/onvif_gen/xsd_dart/lib.dart';
class GetServiceCapabilities {}
@JsonSerializable()
class GetServiceCapabilitiesResponse  {
  /// The capabilities for the device IO service is returned in the Capabilities element.
@JsonKey(name: 'Capabilities')
final Capabilities capabilities;
  GetServiceCapabilitiesResponse({
        required this.capabilities,
  });
}

@JsonSerializable()
class Capabilities  {
  /// Number of video sources (defaults to none).
@JsonKey(name: 'VideoSources')
final int videoSources;
  /// Number of video outputs (defaults to none).
@JsonKey(name: 'VideoOutputs')
final int videoOutputs;
  /// Number of audio sources (defaults to none).
@JsonKey(name: 'AudioSources')
final int audioSources;
  /// Number of audio outputs (defaults to none).
@JsonKey(name: 'AudioOutputs')
final int audioOutputs;
  /// Number of relay outputs (defaults to none).
@JsonKey(name: 'RelayOutputs')
final int relayOutputs;
  /// Number of serial ports (defaults to none).
@JsonKey(name: 'SerialPorts')
final int serialPorts;
  /// Number of digital inputs (defaults to none).
@JsonKey(name: 'DigitalInputs')
final int digitalInputs;
  /// Indicates support for DigitalInput configuration of the idle state (defaults to false).
@JsonKey(name: 'DigitalInputOptions')
final bool digitalInputOptions;
  Capabilities({
        required this.videoSources,
        required this.videoOutputs,
        required this.audioSources,
        required this.audioOutputs,
        required this.relayOutputs,
        required this.serialPorts,
        required this.digitalInputs,
        required this.digitalInputOptions,
  });
}

@JsonSerializable()
class GetRelayOutputOptions  {
  /// 
/// Optional reference token to the relay for which the options are requested.
/// 
@JsonKey(name: 'RelayOutputToken')
final ReferenceToken? relayOutputToken;
  GetRelayOutputOptions({
        this.relayOutputToken,
  });
}

@JsonSerializable()
class GetRelayOutputOptionsResponse  {
  /// 
/// Valid values and ranges for the configuration of a relay output.
/// 
@JsonKey(name: 'RelayOutputOptions')
final RelayOutputOptions? relayOutputOptions;
  GetRelayOutputOptionsResponse({
        this.relayOutputOptions,
  });
}

@JsonSerializable()
class RelayOutputOptions  {
  /// Supported Modes.
@JsonKey(name: 'Mode')
final RelayMode mode;
  /// Supported delay time range or discrete values in seconds. This element must be present if MonoStable mode is supported.
@JsonKey(name: 'DelayTimes')
final DelayTimes? delayTimes;
  /// True if the relay only supports the exact values for the DelayTimes listed. Default is false.
@JsonKey(name: 'Discrete')
final bool? discrete;
  @JsonKey(name: 'Extension')
final RelayOutputOptionsExtension? extension_;
  /// Token of the relay output.
@JsonKey(name: 'token')
final ReferenceToken token;
  RelayOutputOptions({
        required this.mode,
        this.delayTimes,
        this.discrete,
        this.extension_,
        required this.token,
  });
}

class RelayOutputOptionsExtension {}
typedef DelayTimes = List<double>;

class Get {}
@JsonSerializable()
class GetResponse  {
  /// List tokens of a physical IO of a device.
@JsonKey(name: 'Token')
final ReferenceToken? token;
  GetResponse({
        this.token,
  });
}

class GetVideoOutputs {}
@JsonSerializable()
class GetVideoOutputsResponse  {
  /// List containing all physical Video output connections of a device.
@JsonKey(name: 'VideoOutputs')
final VideoOutput? videoOutputs;
  GetVideoOutputsResponse({
        this.videoOutputs,
  });
}

@JsonSerializable()
class GetAudioSourceConfiguration  {
  /// Token of the requested AudioSource.
@JsonKey(name: 'AudioSourceToken')
final ReferenceToken audioSourceToken;
  GetAudioSourceConfiguration({
        required this.audioSourceToken,
  });
}

@JsonSerializable()
class GetAudioSourceConfigurationResponse  {
  /// Current configuration of the Audio input.
@JsonKey(name: 'AudioSourceConfiguration')
final AudioSourceConfiguration audioSourceConfiguration;
  GetAudioSourceConfigurationResponse({
        required this.audioSourceConfiguration,
  });
}

@JsonSerializable()
class GetAudioOutputConfiguration  {
  /// Token of the physical Audio output.
@JsonKey(name: 'AudioOutputToken')
final ReferenceToken audioOutputToken;
  GetAudioOutputConfiguration({
        required this.audioOutputToken,
  });
}

@JsonSerializable()
class GetAudioOutputConfigurationResponse  {
  /// Current configuration of the Audio output.
@JsonKey(name: 'AudioOutputConfiguration')
final AudioOutputConfiguration audioOutputConfiguration;
  GetAudioOutputConfigurationResponse({
        required this.audioOutputConfiguration,
  });
}

@JsonSerializable()
class GetVideoSourceConfiguration  {
  /// Token of the requested VideoSource.
@JsonKey(name: 'VideoSourceToken')
final ReferenceToken videoSourceToken;
  GetVideoSourceConfiguration({
        required this.videoSourceToken,
  });
}

@JsonSerializable()
class GetVideoSourceConfigurationResponse  {
  /// Current configuration of the Video input.
@JsonKey(name: 'VideoSourceConfiguration')
final VideoSourceConfiguration videoSourceConfiguration;
  GetVideoSourceConfigurationResponse({
        required this.videoSourceConfiguration,
  });
}

@JsonSerializable()
class GetVideoOutputConfiguration  {
  /// Token of the requested VideoOutput.
@JsonKey(name: 'VideoOutputToken')
final ReferenceToken videoOutputToken;
  GetVideoOutputConfiguration({
        required this.videoOutputToken,
  });
}

@JsonSerializable()
class GetVideoOutputConfigurationResponse  {
  /// Current configuration of the Video output.
@JsonKey(name: 'VideoOutputConfiguration')
final VideoOutputConfiguration videoOutputConfiguration;
  GetVideoOutputConfigurationResponse({
        required this.videoOutputConfiguration,
  });
}

@JsonSerializable()
class SetAudioSourceConfiguration  {
  @JsonKey(name: 'Configuration')
final AudioSourceConfiguration configuration;
  /// The ForcePersistence element determines how configuration
/// changes shall be stored. If true, changes shall be persistent. If false, changes MAY revert to previous values
/// after reboot.
@JsonKey(name: 'ForcePersistence')
final bool forcePersistence;
  SetAudioSourceConfiguration({
        required this.configuration,
        required this.forcePersistence,
  });
}

class SetAudioSourceConfigurationResponse {}
@JsonSerializable()
class SetAudioOutputConfiguration  {
  @JsonKey(name: 'Configuration')
final AudioOutputConfiguration configuration;
  /// The ForcePersistence element determines how configuration
/// changes shall be stored. If true, changes shall be persistent. If false, changes MAY revert to previous values
/// after reboot.
@JsonKey(name: 'ForcePersistence')
final bool forcePersistence;
  SetAudioOutputConfiguration({
        required this.configuration,
        required this.forcePersistence,
  });
}

class SetAudioOutputConfigurationResponse {}
@JsonSerializable()
class SetVideoSourceConfiguration  {
  @JsonKey(name: 'Configuration')
final VideoSourceConfiguration configuration;
  /// The ForcePersistence element determines how configuration
/// changes shall be stored. If true, changes shall be persistent. If false, changes MAY revert to previous values
/// after reboot.
@JsonKey(name: 'ForcePersistence')
final bool forcePersistence;
  SetVideoSourceConfiguration({
        required this.configuration,
        required this.forcePersistence,
  });
}

class SetVideoSourceConfigurationResponse {}
@JsonSerializable()
class SetVideoOutputConfiguration  {
  @JsonKey(name: 'Configuration')
final VideoOutputConfiguration configuration;
  /// The ForcePersistence element determines how configuration
/// changes shall be stored. If true, changes shall be persistent. If false, changes MAY revert to previous values
/// after reboot.
@JsonKey(name: 'ForcePersistence')
final bool forcePersistence;
  SetVideoOutputConfiguration({
        required this.configuration,
        required this.forcePersistence,
  });
}

class SetVideoOutputConfigurationResponse {}
@JsonSerializable()
class GetVideoSourceConfigurationOptions  {
  /// Token of the Video input whose options are requested..
@JsonKey(name: 'VideoSourceToken')
final ReferenceToken videoSourceToken;
  GetVideoSourceConfigurationOptions({
        required this.videoSourceToken,
  });
}

@JsonSerializable()
class GetVideoSourceConfigurationOptionsResponse  {
  @JsonKey(name: 'VideoSourceConfigurationOptions')
final VideoSourceConfigurationOptions videoSourceConfigurationOptions;
  GetVideoSourceConfigurationOptionsResponse({
        required this.videoSourceConfigurationOptions,
  });
}

@JsonSerializable()
class GetVideoOutputConfigurationOptions  {
  /// Token of the Video Output whose options are requested..
@JsonKey(name: 'VideoOutputToken')
final ReferenceToken videoOutputToken;
  GetVideoOutputConfigurationOptions({
        required this.videoOutputToken,
  });
}

@JsonSerializable()
class GetVideoOutputConfigurationOptionsResponse  {
  @JsonKey(name: 'VideoOutputConfigurationOptions')
final VideoOutputConfigurationOptions videoOutputConfigurationOptions;
  GetVideoOutputConfigurationOptionsResponse({
        required this.videoOutputConfigurationOptions,
  });
}

@JsonSerializable()
class GetAudioSourceConfigurationOptions  {
  /// Token of the physical Audio input whose options are requested..
@JsonKey(name: 'AudioSourceToken')
final ReferenceToken audioSourceToken;
  GetAudioSourceConfigurationOptions({
        required this.audioSourceToken,
  });
}

@JsonSerializable()
class GetAudioSourceConfigurationOptionsResponse  {
  /// Returns the AudioSourceToken available.
@JsonKey(name: 'AudioSourceOptions')
final AudioSourceConfigurationOptions audioSourceOptions;
  GetAudioSourceConfigurationOptionsResponse({
        required this.audioSourceOptions,
  });
}

@JsonSerializable()
class GetAudioOutputConfigurationOptions  {
  /// Token of the physical Audio Output whose options are requested..
@JsonKey(name: 'AudioOutputToken')
final ReferenceToken audioOutputToken;
  GetAudioOutputConfigurationOptions({
        required this.audioOutputToken,
  });
}

@JsonSerializable()
class GetAudioOutputConfigurationOptionsResponse  {
  /// Available settings and ranges for the requested Audio output.
@JsonKey(name: 'AudioOutputOptions')
final AudioOutputConfigurationOptions audioOutputOptions;
  GetAudioOutputConfigurationOptionsResponse({
        required this.audioOutputOptions,
  });
}

@JsonSerializable()
class SetRelayOutputSettings  {
  @JsonKey(name: 'RelayOutput')
final RelayOutput relayOutput;
  SetRelayOutputSettings({
        required this.relayOutput,
  });
}

class SetRelayOutputSettingsResponse {}
/// Get the available digital inputs of a device.
class GetDigitalInputs {}
/// Requested digital inputs.
@JsonSerializable()
class GetDigitalInputsResponse  {
  @JsonKey(name: 'DigitalInputs')
final DigitalInput? digitalInputs;
  GetDigitalInputsResponse({
        this.digitalInputs,
  });
}

@JsonSerializable()
class DigitalInputConfigurationOptions  {
  /// Configuration Options for a digital input.
@JsonKey(name: 'IdleState')
final DigitalIdleState idleState;
  DigitalInputConfigurationOptions({
        required this.idleState,
  });
}

@JsonSerializable()
class GetDigitalInputConfigurationOptions  {
  @JsonKey(name: 'Token')
final ReferenceToken? token;
  GetDigitalInputConfigurationOptions({
        this.token,
  });
}

@JsonSerializable()
class GetDigitalInputConfigurationOptionsResponse  {
  @JsonKey(name: 'DigitalInputOptions')
final DigitalInputConfigurationOptions digitalInputOptions;
  GetDigitalInputConfigurationOptionsResponse({
        required this.digitalInputOptions,
  });
}

@JsonSerializable()
class SetDigitalInputConfigurations  {
  @JsonKey(name: 'DigitalInputs')
final DigitalInput digitalInputs;
  SetDigitalInputConfigurations({
        required this.digitalInputs,
  });
}

class SetDigitalInputConfigurationsResponse {}
/// The physical serial port on the device that allows serial data to be read and written.
class GetSerialPorts {}
/// Requested serial ports.
@JsonSerializable()
class GetSerialPortsResponse  {
  @JsonKey(name: 'SerialPort')
final SerialPort? serialPort;
  GetSerialPortsResponse({
        this.serialPort,
  });
}

/// Gets the configuration that relates to serial port configuration.
@JsonSerializable()
class GetSerialPortConfiguration  {
  @JsonKey(name: 'SerialPortToken')
final ReferenceToken serialPortToken;
  GetSerialPortConfiguration({
        required this.serialPortToken,
  });
}

/// Requested serial port configuration.
@JsonSerializable()
class GetSerialPortConfigurationResponse  {
  @JsonKey(name: 'SerialPortConfiguration')
final SerialPortConfiguration serialPortConfiguration;
  GetSerialPortConfigurationResponse({
        required this.serialPortConfiguration,
  });
}

/// Sets the configuration that relates to serial port configuration.
@JsonSerializable()
class SetSerialPortConfiguration  {
  @JsonKey(name: 'SerialPortConfiguration')
final SerialPortConfiguration serialPortConfiguration;
  @JsonKey(name: 'ForcePersistance')
final bool forcePersistance;
  SetSerialPortConfiguration({
        required this.serialPortConfiguration,
        required this.forcePersistance,
  });
}

class SetSerialPortConfigurationResponse {}
/// Gets the configuration options that relates to serial port configuration.
@JsonSerializable()
class GetSerialPortConfigurationOptions  {
  @JsonKey(name: 'SerialPortToken')
final ReferenceToken serialPortToken;
  GetSerialPortConfigurationOptions({
        required this.serialPortToken,
  });
}

/// Requested serial port configuration options.
@JsonSerializable()
class GetSerialPortConfigurationOptionsResponse  {
  @JsonKey(name: 'SerialPortOptions')
final SerialPortConfigurationOptions serialPortOptions;
  GetSerialPortConfigurationOptionsResponse({
        required this.serialPortOptions,
  });
}

/// Transmitting arbitrary data to the connected serial device and then receiving its response data.
@JsonSerializable()
class SendReceiveSerialCommand  {
  /// The physical serial port reference to be used when this request is invoked.
@JsonKey(name: 'Token')
final ReferenceToken? token;
  /// The serial port data.
@JsonKey(name: 'SerialData')
final SerialData? serialData;
  /// Indicates that the command should be responded back within the specified period of time.
@JsonKey(name: 'TimeOut')
final Duration? timeOut;
  /// This element may be put in the case that data length returned from the connected serial device is already determined as some fixed bytes length. It indicates the length of received data which can be regarded as available.
@JsonKey(name: 'DataLength')
final int? dataLength;
  /// This element may be put in the case that the delimiter codes returned from the connected serial device is already known. It indicates the termination data sequence of the responded data. In case the string has more than one character a device shall interpret the whole string as a single delimiter. Furthermore a device shall return the delimiter character(s) to the client.
@JsonKey(name: 'Delimiter')
final String? delimiter;
  SendReceiveSerialCommand({
        this.token,
        this.serialData,
        this.timeOut,
        this.dataLength,
        this.delimiter,
  });
}

/// Receiving the response data.
@JsonSerializable()
class SendReceiveSerialCommandResponse  {
  @JsonKey(name: 'SerialData')
final SerialData? serialData;
  SendReceiveSerialCommandResponse({
        this.serialData,
  });
}

/// The serial port data.
class SerialData {}
/// Lists all available serial ports of a device

/// The type of serial port.Generic can be signaled as a vendor specific serial port type.
enum SerialPortType {
  @JsonValue("RS232")
  RS232,
  @JsonValue("RS422HalfDuplex")
  RS422HalfDuplex,
  @JsonValue("RS422FullDuplex")
  RS422FullDuplex,
  @JsonValue("RS485HalfDuplex")
  RS485HalfDuplex,
  @JsonValue("RS485FullDuplex")
  RS485FullDuplex,
  @JsonValue("Generic")
  Generic,
}

/// The parameters for configuring the serial port.
@JsonSerializable()
class SerialPortConfiguration  {
  /// The transfer bitrate.
@JsonKey(name: 'BaudRate')
final int baudRate;
  /// The parity for the data error detection.
@JsonKey(name: 'ParityBit')
final ParityBit parityBit;
  /// The bit length for each character.
@JsonKey(name: 'CharacterLength')
final int characterLength;
  /// The number of stop bits used to terminate each character.
@JsonKey(name: 'StopBit')
final double stopBit;
  @JsonKey(name: 'token')
final ReferenceToken token;
  @JsonKey(name: 'type')
final SerialPortType type;
  SerialPortConfiguration({
        required this.baudRate,
        required this.parityBit,
        required this.characterLength,
        required this.stopBit,
        required this.token,
        required this.type,
  });
}

/// The parity for the data error detection.
enum ParityBit {
  @JsonValue("None")
  None,
  @JsonValue("Even")
  Even,
  @JsonValue("Odd")
  Odd,
  @JsonValue("Mark")
  Mark,
  @JsonValue("Space")
  Space,
  @JsonValue("Extended")
  Extended,
}

/// The configuration options that relates to serial port.
@JsonSerializable()
class SerialPortConfigurationOptions  {
  /// The list of configurable transfer bitrate.
@JsonKey(name: 'BaudRateList')
final IntList baudRateList;
  /// The list of configurable parity for the data error detection.
@JsonKey(name: 'ParityBitList')
final ParityBitList parityBitList;
  /// The list of configurable bit length for each character.
@JsonKey(name: 'CharacterLengthList')
final IntList characterLengthList;
  /// The list of configurable number of stop bits used to terminate each character.
@JsonKey(name: 'StopBitList')
final FloatList stopBitList;
  @JsonKey(name: 'token')
final ReferenceToken token;
  SerialPortConfigurationOptions({
        required this.baudRateList,
        required this.parityBitList,
        required this.characterLengthList,
        required this.stopBitList,
        required this.token,
  });
}

/// The list of configurable parity for the data error detection.
@JsonSerializable()
class ParityBitList  {
  @JsonKey(name: 'Items')
final ParityBit? items;
  ParityBitList({
        this.items,
  });
}
