import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/screens/home/tabs/done_tab.dart';
import 'package:homekeeping/screens/home/tabs/metrics_tab.dart';
import 'package:homekeeping/screens/home/tabs/month_tab.dart';
import 'package:homekeeping/screens/home/tabs/today_tab.dart';
import 'package:homekeeping/screens/home/tabs/week_tab.dart';
import 'package:homekeeping/widgets/submit_fab.dart';

class AgendaScreen extends ConsumerWidget {
  const AgendaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Homekeeping'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Today'),
              Tab(text: 'Week'),
              Tab(text: 'Month'),
              Tab(text: 'Done'),
              Tab(text: 'Metrics'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TodayTab(),
            WeekTab(),
            MonthTab(),
            DoneTab(),
            MetricsTab(),
          ],
        ),
        floatingActionButton: const SubmitFAB(),
      ),
    );
  }
}