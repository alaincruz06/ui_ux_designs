//Packages
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ui_ux_designs/src/1_pokedex/data/datasources/pokedex_provider_impl.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/mapper/pokedex_mapper.dart';
import 'package:ui_ux_designs/src/1_pokedex/domain/repository/pokedex_repository.dart';
import 'package:ui_ux_designs/src/2_tasks/data/datasources/tasks_provider_impl.dart';
import 'package:ui_ux_designs/src/2_tasks/data/models/task_model.dart';
import 'package:ui_ux_designs/src/2_tasks/domain/mappers/task_mapper.dart';
import 'package:ui_ux_designs/src/2_tasks/domain/repository/tasks_repository.dart';
import 'package:ui_ux_designs/src/common/utils/dio_client.dart';
import 'package:ui_ux_designs/src/common/utils/language_controller.dart';
import 'package:ui_ux_designs/src/common/utils/logger/logger_filter.dart';

class DependencyInjection {
  static Future<void> init() async {
    await _initPackageInfo();

    _setupLogger();

    _setupMappers();

    await _setupIsar();

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

  static void _setupMappers() {
    Get
      ..lazyPut<PokedexMapper>(PokedexMapperImpl.new, fenix: true)
      ..lazyPut<TaskMapper>(TaskMapperImpl.new, fenix: true);
  }

  static Future<void> _setupIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [TaskModelSchema],
      directory: dir.path,
      //Logger para las queries de Isar
      inspector: true,
    );

    Get.lazyPut<Isar>(
      () => isar,
      fenix: true,
    );
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
      )
      ..lazyPut<TasksProvider>(
        () => TasksProviderImpl(
          isar: Get.find<Isar>(),
          logger: Get.find<Logger>(),
        ),
        fenix: true,
      );
  }

  static void _setupRepositories() {
    Get
      ..lazyPut<PokedexRepository>(
        () => PokedexRepositoryImpl(
          logger: Get.find<Logger>(),
          pokedexMapper: Get.find<PokedexMapper>(),
          pokedexProvider: Get.find<PokedexProvider>(),
        ),
        fenix: true,
      )
      ..lazyPut<TasksRepository>(
        () => TasksRepositoryImpl(
          logger: Get.find<Logger>(),
          tasksProvider: Get.find<TasksProvider>(),
          taskMapper: Get.find<TaskMapper>(),
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
