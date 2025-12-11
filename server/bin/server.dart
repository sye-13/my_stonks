import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:server/server.dart';
import 'package:server/src/assets/asset_repository.dart';

Future<void> main(List<String> arguments) async {
  final assetService = AssetService(assetRepository: AssetRepository());
  final server = Server.create(
    services: [assetService],
    codecRegistry: CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  try {
    await server.serve(port: 50051); // TODO: make port customizable.
    print('Server listening on port ${server.port}...');
  } catch (e) {
    print('Failed to start server: $e');
    assetService.dispose();
    exit(1);
  }

  // Handle shutdown signals
  ProcessSignal.sigint.watch().listen((signal) async {
    print('Received shutdown signal: $signal');
    assetService.dispose();
    await server.shutdown();
    print('Server has been shut down.');
    exit(0);
  });
}
