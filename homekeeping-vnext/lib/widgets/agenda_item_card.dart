import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homekeeping/models/agenda_item.dart';
import 'package:homekeeping/models/settings.dart';
import 'package:homekeeping/providers/data_providers.dart';
import 'package:homekeeping/utils/grace_utils.dart';

class AgendaItemCard extends ConsumerWidget {
  final AgendaItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const AgendaItemCard({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(settingsProvider);

    return settingsAsync.when(
      data: (settings) => _buildCard(context, settings),
      loading: () => const Card(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (_, __) => const Card(
        child: Center(child: Text('Error loading settings')),
      ),
    );
  }

  Widget _buildCard(BuildContext context, AppSettings settings) {
    final isGrace = GraceUtils.isInGracePeriod(item, settings);
    final backgroundColor = isSelected
        ? Colors.green.shade100
        : isGrace
            ? Colors.red.shade100
            : item.isRolledIn
                ? Colors.yellow.shade100
                : null;

    return Card(
      color: backgroundColor,
      child: ListTile(
        onTap: onTap,
        title: Text(
          item.task.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: _buildSubtitle(settings),
        trailing: _buildTrailingIcon(),
        leading: isSelected
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.radio_button_unchecked),
      ),
    );
  }

  Widget? _buildTrailingIcon() {
    if (item.task.requireBoth) {
      return const Tooltip(
        message: 'Requires both BG and KG',
        child: Icon(Icons.people),
      );
    }

    if (item.task.assignedTo.isNotEmpty) {
      return Tooltip(
        message: 'Assigned to ${item.task.assignedTo}',
        child: Icon(
          Icons.person,
          color: item.task.assignedTo == 'BG'
              ? Colors.blue
              : item.task.assignedTo == 'KG'
                  ? Colors.purple
                  : null,
        ),
      );
    }

    return null;
  }

  Widget _buildSubtitle(AppSettings settings) {
    final parts = <String>[];

    if (item.isRolledIn) {
      parts.add('(${item.bucket} task)');
    }

    if (GraceUtils.isInGracePeriod(item, settings)) {
      parts.add(GraceUtils.getGraceMessage(item, settings));
    }

    if (parts.isEmpty) {
      return Text(
        item.task.description,
        style: const TextStyle(fontStyle: FontStyle.italic),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.task.description),
        const SizedBox(height: 4),
        Text(
          parts.join(' • '),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}