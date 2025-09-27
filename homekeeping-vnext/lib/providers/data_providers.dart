import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/models/agenda_item.dart';
import 'package:homekeeping/models/settings.dart';
import 'package:homekeeping/repositories/agenda_repository.dart';
import 'package:homekeeping/repositories/settings_repository.dart';

final settingsRepositoryProvider = Provider((ref) => SettingsRepository());

final settingsProvider = StreamProvider<AppSettings>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return repository.watchSettings();
});

final agendaRepositoryProvider = Provider((ref) => AgendaRepository());

final agendaItemsProvider = StreamProvider.family<List<AgendaItem>, String>((ref, bucket) {
  final repository = ref.watch(agendaRepositoryProvider);
  return repository.watchAgendaItems(bucket);
});