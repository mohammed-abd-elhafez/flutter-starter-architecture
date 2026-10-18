import 'package:flutter/material.dart';

import '../../domain/dashboard_models.dart';

class MetricCard extends StatelessWidget {
  const MetricCard({required this.metric, super.key});

  final DashboardMetric metric;

  static const _icons = <int, IconData>{
    0xe8b6: IconData(0xe8b6, fontFamily: 'MaterialIcons'),
    0xe8f0: IconData(0xe8f0, fontFamily: 'MaterialIcons'),
    0xe873: IconData(0xe873, fontFamily: 'MaterialIcons'),
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                _icons[metric.iconCode] ?? Icons.analytics_outlined,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    metric.label,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.58),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    metric.value,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    metric.description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.54),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
