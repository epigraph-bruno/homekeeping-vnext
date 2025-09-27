import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ViewFilter {
  mine,
  all;

  String get label => switch (this) {
    ViewFilter.mine => 'Mine',
    ViewFilter.all => 'All',
  };
}

final viewFilterProvider = StateProvider<ViewFilter>((ref) => ViewFilter.mine);
