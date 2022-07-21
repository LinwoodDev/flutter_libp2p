import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_libp2p_platform_interface.dart';

/// An implementation of [FlutterLibp2pPlatform] that uses method channels.
class MethodChannelFlutterLibp2p extends FlutterLibp2pPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_libp2p');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
