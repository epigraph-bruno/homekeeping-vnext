import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/services/event_service.dart';

final eventServiceProvider = Provider<EventService>((ref) => EventService());
