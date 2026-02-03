import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

import 'package:flutter_portfolio/design_systems/components/max_container.dart';
import 'package:flutter_portfolio/utils/breakpoint.dart';
import 'package:flutter_portfolio/design_systems/components/label_with_description.dart';

class CompaniesSections extends StatelessWidget {
  const CompaniesSections({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);


    if (breakpoint.equals(Breakpoint.desktop)) {
    } else if (breakpoint.largerThanLaptop) {
    }


    return Column(
      children: [
          LayoutBuilder(
              builder: (context, constraint) {
                final fullWidth = constraint.biggest.width;
                final halfWidth = fullWidth / 1.5;

                final width = breakpoint.largerOrEqualToLaptop ? halfWidth : fullWidth;

                return Container(
                  width: width,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(bottom: 64),
                  child: const LabelWithDescription(
                    labelWithDescriptionAlign: LabelWithDescriptionAlign.center,
                    title: 'About Us',
                    subtitle:
                        '',
                  ),
                );
              },
            ),
        MaxContainer(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 32),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Wrap(
                spacing: 64,
                runSpacing: 32,
                alignment: WrapAlignment.center,
                children: [
                  //put cards here
                  SizedBox(
                     width: 320,
                    child: IconInfoCard(
                        icon: Boxicons.bxs_rocket,
                        title: 'Our Mission',
                        subtitle:
                            'To build meaningful digital products that solve real problems and empower people through thoughtful design and reliable technology.',
                        iconColor: Colors.deepPurple,
                      ),
                  ),
                    SizedBox(
                      width: 320,
                      child: IconInfoCard(
                        icon: Boxicons.bxs_book,
                        title: 'Our Values',
                        subtitle:
                            'We believe in integrity, simplicity, collaboration, and continuous learning to deliver quality experiences that truly matter.',
                        iconColor: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 320,
                      child: IconInfoCard(
                        icon: Boxicons.bxs_show, // eye icon
                        title: 'Our Vision',
                        subtitle:
                            'To shape a future where technology is accessible, impactful, and inspires growth for individuals and businesses alike.',
                        iconColor: Colors.green,
                      ),
                    ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
class IconInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  const IconInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      elevation: 3,
      color: theme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 28,
                color: iconColor,
              ),
            ),
            const SizedBox(height: 12),

            // ✅ Title (always visible)
            Text(
  title,
  style: theme.textTheme.titleSmall?.copyWith(
    fontSize: 16, // 👈 title size
    color: isDark ? Colors.white : Colors.black87,
    fontWeight: FontWeight.w600,
  ),
  textAlign: TextAlign.center,
),

const SizedBox(height: 8),

// ✅ Subtitle (soft but readable)
Text(
  subtitle,
  style: theme.textTheme.bodySmall?.copyWith(
    fontSize: 13, // 👈 subtitle size
    color: isDark ? Colors.white70 : Colors.black54,
    height: 1.4,
  ),
  textAlign: TextAlign.center,
),

          ],
        ),
      ),
    );
  }
}
