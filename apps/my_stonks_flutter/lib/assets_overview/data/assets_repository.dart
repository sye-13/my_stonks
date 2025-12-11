import 'package:server/server.dart';

class AssetsRepository {
  const AssetsRepository({
    required AssetsServiceClient assetsServiceClient,
  }) : _assetsServiceClient = assetsServiceClient;

  final AssetsServiceClient _assetsServiceClient;

  Stream<List<AssetWithPerformanceHistory>> getAssets() => _assetsServiceClient
      .streamAssets(Empty())
      .map((listUpdate) => listUpdate.assets);
}
