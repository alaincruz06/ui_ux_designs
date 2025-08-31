import 'package:get/get.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/bindings/pokedex_home_page_binding.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/bindings/pokemon_details_page_binding.dart';
import 'package:ui_ux_designs/src/1_pokedex/presentation/pages/pokedex_pages_export.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/bindings/add_edit_task_page_binding.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/bindings/task_details_page_binding.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/bindings/tasks_home_page_binding.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/pages/add_edit_task_page/add_edit_task_page.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/pages/add_edit_task_page/frequency_task_page.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/pages/task_details_page/task_details_page.dart';
import 'package:ui_ux_designs/src/2_tasks/presentation/pages/tasks_home_page/tasks_home_page.dart';
import 'package:ui_ux_designs/src/common/presentation/bindings/home_page_binding.dart';
import 'package:ui_ux_designs/src/common/presentation/pages/home_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
    //
    GetPage(
      name: Routes.pokedexHome,
      page: () => const PokedexHomePage(),
      binding: PokedexHomePageBinding(),
    ),
    GetPage(
      name: Routes.pokemonDetails,
      page: () => const PokemonDetailsPage(),
      binding: PokemonDetailsPageBinding(),
    ),
    //
    GetPage(
      name: Routes.tasksHome,
      page: () => const TasksHomePage(),
      binding: TasksHomePageBinding(),
    ),
    GetPage(
      name: Routes.taskDetails,
      page: () => const TaskDetailsPage(),
      binding: TaskDetailsPageBinding(),
    ),
    GetPage(
      name: Routes.addEditTask,
      page: () => const AddEditTaskPage(),
      binding: AddEditTaskPageBinding(),
    ),
    GetPage(
      name: Routes.frequencyTask,
      page: () => const FrequencyTaskPage(),
    ),
  ];
}
