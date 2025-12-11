import 'package:grpc/grpc.dart';
import 'package:server/src/assets/asset_repository.dart';
import 'package:server/src/assets/generated/asset.pbgrpc.dart';

class AssetService extends AssetsServiceBase {
  AssetService({required AssetRepository assetRepository})
    : _assetRepository = assetRepository;

  final AssetRepository _assetRepository;

  @override
  Stream<AssetListUpdate> streamAssets(ServiceCall call, Empty request) async* {
    await for (final assets in _assetRepository.assetUpdates) {
      try {
        yield AssetListUpdate(
          assets: assets,
          success: true,
          message: 'Assets updated',
        );
      } catch (e) {
        print('Error while processing asset updates: $e');
        yield AssetListUpdate(
          assets: assets,
          success: false,
          message: 'Error processing asset updates: ${e.toString()}',
        );
      }
    }
  }

  @override
  Future<AssetListUpdate> updateAsset(
    ServiceCall call,
    AssetWithPerformanceHistory request,
  ) async {
    try {
      await _assetRepository.updateAsset(request);
      return AssetListUpdate(
        assets: _assetRepository.getAssets(),
        success: true,
        message: 'Asset updated successfully',
      );
    } catch (e) {
      return AssetListUpdate(
        assets: _assetRepository.getAssets(),
        success: false,
        message: 'Failed to update asset: ${e.toString()}',
      );
    }
  }

  void dispose() {
    _assetRepository.dispose();
  }
}
