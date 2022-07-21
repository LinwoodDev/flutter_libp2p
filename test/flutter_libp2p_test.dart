import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_libp2p/flutter_libp2p.dart';
import 'package:flutter_libp2p/flutter_libp2p_platform_interface.dart';
import 'package:flutter_libp2p/flutter_libp2p_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterLibp2pPlatform 
    with MockPlatformInterfaceMixin
    implements FlutterLibp2pPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterLibp2pPlatform initialPlatform = FlutterLibp2pPlatform.instance;

  test('$MethodChannelFlutterLibp2p is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterLibp2p>());
  });

  test('getPlatformVersion', () async {
    FlutterLibp2p flutterLibp2pPlugin = FlutterLibp2p();
    MockFlutterLibp2pPlatform fakePlatform = MockFlutterLibp2pPlatform();
    FlutterLibp2pPlatform.instance = fakePlatform;
  
    expect(await flutterLibp2pPlugin.getPlatformVersion(), '42');
  });
}
