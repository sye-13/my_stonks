import 'dart:async';

import 'package:server/src/assets/data.dart';

import 'generated/asset.pb.dart';

class AssetRepository {
  final StreamController<List<Asset>> _controller =
      StreamController<List<Asset>>.broadcast();

  Stream<List<Asset>> get assetUpdates => _controller.stream;

  List<Asset> getAssets() {
    return List.from(assets);
  }

  Future<void> updateAsset(Asset asset) async {
    final index = assets.indexWhere(
      (a) =>
          (a.hasStock() && a.stock.id == asset.stock.id) ||
          (a.hasEtf() && a.etf.id == asset.etf.id),
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
