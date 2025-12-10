import 'dart:math';

import 'package:grpc/grpc.dart';
import 'package:server/src/assets/data.dart';
import 'package:server/src/assets/generated/asset.pbgrpc.dart';

class AssetService extends AssetsServiceBase {
  @override
  Stream<AssetListUpdate> streamAssets(ServiceCall call, Empty request) async* {
    final random = Random();

    try {
      while (true) {
        await Future.delayed(const Duration(seconds: 5));
        if (call.isCanceled) {
          print('Client cancelled: ending stream');
          break;
        }
        for (var asset in assets) {
          if (asset.hasStock()) {
            asset.stock.currentPrice += (random.nextDouble() * 2 - 1);
          } else {
            asset.etf.currentPrice += (random.nextDouble() * 2 - 1);
          }
        }

        yield AssetListUpdate(
            assets: assets,
            success: true,
            message: "Asset prices updated"
        );
      }
    } catch (e) {
      print('Stream error: $e');
    }
  }
}
