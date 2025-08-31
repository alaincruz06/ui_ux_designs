part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const home = _Paths.home;
  //1 Pokedex
  static const pokedexHome = _Paths.pokedexHome;
  static const pokemonDetails = _Paths.pokemonDetails;
  //2 Tasks
  static const tasksHome = _Paths.tasksHome;
  static const taskDetails = _Paths.taskDetails;
  static const addEditTask = _Paths.addEditTask;
  static const frequencyTask = _Paths.frequencyTask;
}

abstract class _Paths {
  static const home = '/home';
  //1 Pokedex
  static const pokedexHome = '/pokedex-home';
  static const pokemonDetails = '/pokemon-details';
  //2 Tasks
  static const tasksHome = '/tasks-home';
  static const taskDetails = '/task-details';
  static const addEditTask = '/add-edit-task';
  static const frequencyTask = '/frequency-task';
}
