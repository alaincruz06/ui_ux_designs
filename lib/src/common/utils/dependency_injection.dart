import 'package:connectivity_plus/connectivity_plus.dart';

//Packages
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/datasources/pokedex_provider_impl.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/mapper/pokedex_mapper.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/repository/pokedex_repository.dart';
import 'package:ui_ux_designs/src/common/utils/dio_client.dart';
import 'package:ui_ux_designs/src/common/utils/language_controller.dart';
import 'package:ui_ux_designs/src/common/utils/logger/logger_filter.dart';

class DependencyInjection {
  static Future<void> init() async {
    await _initPackageInfo();

    _setupLogger();

    _setupConnection();

    _setupMappers();

    await _setupProviders();

    _setupRepositories();

    _setupControllers();
  }

  static void _setupLogger() {
    Get
      ..lazyPut(() => Logger(), fenix: true)
      ..lazyPut<Logger>(
        () => Logger(
          printer: PrettyPrinter(methodCount: 0),
          filter: LoggerFilter(),
        ),
        fenix: true,
        tag: 'ControllerLogger',
      );
  }

  static void _setupConnection() {
    Get
      ..put<Connectivity>(Connectivity(), permanent: true)
      ..put<InternetConnectionChecker>(
        InternetConnectionChecker(),
        permanent: true,
      );
  }

  static void _setupMappers() {
    Get.lazyPut<PokedexMapper>(PokedexMapperImpl.new, fenix: true)
        /*  ..lazyPut<ProductMapper>(ProductMapperImpl.new, fenix: true)
      ..lazyPut<UserMapper>(UserMapperImpl.new, fenix: true) */
        ;
  }

  static Future<void> _setupProviders() async {
    Get
      ..lazyPut<Dio>(
        () => Dio(),
        fenix: true,
      )
      ..lazyPut<DioHttpClient>(
        () => DioHttpClientImpl(
          Get.find<Dio>(),
          Get.find<Logger>(),
        ),
        fenix: true,
      )
      ..lazyPut<PokedexProvider>(
        () => PokedexProviderImpl(
          client: Get.find<DioHttpClient>(),
          logger: Get.find<Logger>(),
        ),
        fenix: true,
      );
  }

  static void _setupRepositories() {
    Get.lazyPut<PokedexRepository>(
      () => PokedexRepositoryImpl(
        logger: Get.find<Logger>(),
        pokedexMapper: Get.find<PokedexMapper>(),
        pokedexProvider: Get.find<PokedexProvider>(),
      ),
      fenix: true,
    );
  }

  static void _setupControllers() {
    Get.put<LanguageController>(
      LanguageController(),
    );
  }

  static Future<void> _initPackageInfo() async {
    var packageInfo = await PackageInfo.fromPlatform();
    Get.put<PackageInfo>(packageInfo, permanent: true);
  }
}
