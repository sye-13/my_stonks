import 'package:grpc/grpc.dart';
import 'package:my_stonks_flutter/app/app.dart';
import 'package:my_stonks_flutter/bootstrap.dart';

Future<void> main() async {
  final channel = ClientChannel(
    'your_staging_host_here',
    port: 50051,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      codecRegistry: CodecRegistry(
        codecs: const [GzipCodec(), IdentityCodec()],
      ),
    ),
  );
  await bootstrap(
    channel,
        (assetsRepository) => App(
      assetsRepository: assetsRepository,
    ),
  );
}
