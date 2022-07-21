import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_libp2p_method_channel.dart';

abstract class FlutterLibp2pPlatform extends PlatformInterface {
  /// Constructs a FlutterLibp2pPlatform.
  FlutterLibp2pPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterLibp2pPlatform _instance = MethodChannelFlutterLibp2p();

  /// The default instance of [FlutterLibp2pPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterLibp2p].
  static FlutterLibp2pPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterLibp2pPlatform] when
  /// they register themselves.
  static set instance(FlutterLibp2pPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
