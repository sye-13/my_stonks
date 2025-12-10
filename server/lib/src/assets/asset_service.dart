import 'dart:math';

import 'package:grpc/grpc.dart';
import 'package:server/src/assets/data.dart';
import 'package:server/src/assets/generated/asset.pbgrpc.dart';

class AssetService extends AssetsServiceBase {
  @override
  Stream<AssetListUpdate> streamAssets(ServiceCall call, Empty request) async* {
    final data = assets;
    try {
      while (true) {
        await Future.delayed(Duration(seconds: Random().nextInt(5) + 1));
        yield AssetListUpdate()
          ..assets.addAll(data)
          ..success = true
          ..message = ''; // TODO: update to simulate realtime updates.
      }
    } catch (e) {
      print('Stream error: $e');
    }
  }
}
