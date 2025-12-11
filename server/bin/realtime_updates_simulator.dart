import 'dart:io';
import 'dart:math';

import 'package:grpc/grpc.dart';
import 'package:server/server.dart';
import 'package:server/src/assets/data.dart';

Future<void> main(List<String> arguments) async {
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      codecRegistry: CodecRegistry(
        codecs: const [GzipCodec(), IdentityCodec()],
      ),
    ),
  );

  try {
    ProcessSignal.sigint.watch().listen((signal) async {
      print('Received shutdown signal: $signal');
      await channel.shutdown();
      exit(0);
    });

    final assetServiceClient = AssetsServiceClient(channel);

    while (true) {
      await Future.delayed(const Duration(seconds: 5));
      for (var asset in assets) {
        if (asset.hasStock()) {
          asset.stock.currentPrice = _generateRandomPrice(
            asset.stock.currentPrice,
          );
          print('[Update] Stock - ${asset.stock} - ${asset.stock.currentPrice}');
        } else {
          asset.etf.currentPrice = _generateRandomPrice(asset.etf.currentPrice);
          print('[Update] ETF - ${asset.etf} - ${asset.etf.currentPrice}');
        }
        try {
          await assetServiceClient.updateAsset(asset);
        } catch (e) {
          print('Failed to update asset $asset: ${e.toString()}');
        }
      }
      print('[Update] --------------------------------------------------');
    }
  } catch (e) {
    await channel.shutdown();
    exit(1);
  }
}

final random = Random();

double _generateRandomPrice(double currentPrice) {
  final fluctuation = currentPrice * 0.1;
  final minPrice = currentPrice - fluctuation;
  final maxPrice = currentPrice + fluctuation;
  return minPrice + (random.nextDouble() * (maxPrice - minPrice));
}
