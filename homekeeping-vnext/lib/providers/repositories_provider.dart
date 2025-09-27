import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/repositories/agenda_repository.dart';
import 'package:homekeeping/repositories/event_repository.dart';
import 'package:homekeeping/repositories/settings_repository.dart';
import 'package:homekeeping/repositories/task_repository.dart';

// Repository providers
final taskRepositoryProvider = Provider<TaskRepository>((ref) => TaskRepository());
final agendaRepositoryProvider = Provider<AgendaRepository>((ref) => AgendaRepository());
final eventRepositoryProvider = Provider<EventRepository>((ref) => EventRepository());
final settingsRepositoryProvider = Provider<SettingsRepository>((ref) => SettingsRepository());
