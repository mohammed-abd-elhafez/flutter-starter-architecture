import 'package:flutter/material.dart';

import '../../domain/dashboard_models.dart';

class ChecklistCard extends StatelessWidget {
  const ChecklistCard({required this.item, required this.onChanged, super.key});

  final ChecklistItem item;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = Colors.white.withValues(alpha: 0.58);

    return Card(
      child: InkWell(
        onTap: onChanged,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 18, 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: item.completed,
                onChanged: (_) => onChanged(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        decoration: item.completed
                            ? TextDecoration.lineThrough
                            : null,
                        color: item.completed ? muted : null,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item.description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: muted,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              if (item.completed)
                Icon(
                  Icons.check_circle_rounded,
                  size: 20,
                  color: theme.colorScheme.tertiary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
