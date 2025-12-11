import 'package:flutter/widgets.dart';
import 'package:grpc/grpc.dart';
import 'package:my_stonks_flutter/app/app.dart';
import 'package:my_stonks_flutter/bootstrap.dart';
import 'package:my_stonks_flutter/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final channel = ClientChannel(
    '10.0.2.2',
    port: 50051,
    options: ChannelOptions(
      credentials: const ChannelCredentials.insecure(),
      codecRegistry: CodecRegistry(
        codecs: const [GzipCodec(), IdentityCodec()],
      ),
    ),
  );
  final sharedPreferences = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: <String>{ThemeApi.kMyStonksThemeKey},
    ),
  );
  final themeApi = ThemeApi(plugin: sharedPreferences);
  await bootstrap(
    channel,
    themeApi,
    (assetsRepository, themeRepository) => App(
      assetsRepository: assetsRepository,
      themeRepository: themeRepository,
    ),
  );
}
