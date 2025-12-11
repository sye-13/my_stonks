import 'dart:async';

import 'package:server/src/assets/data.dart';

import 'generated/asset.pb.dart';

class AssetRepository {
  final StreamController<List<AssetWithPerformanceHistory>> _controller =
      StreamController<List<AssetWithPerformanceHistory>>.broadcast();

  Stream<List<AssetWithPerformanceHistory>> get assetUpdates =>
      _controller.stream;

  List<AssetWithPerformanceHistory> getAssets() {
    return List.from(assets);
  }

  Future<void> updateAsset(AssetWithPerformanceHistory asset) async {
    final index = assets.indexWhere(
      (a) =>
          (a.asset.hasStock() && a.asset.stock.id == asset.asset.stock.id) ||
          (a.asset.hasEtf() && a.asset.etf.id == asset.asset.etf.id),
    );

    if (index != -1) {
      assets[index] = asset;
      _controller.add(List.from(assets));
    }
  }

  void dispose() {
    _controller.close();
  }
}
