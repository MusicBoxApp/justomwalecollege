import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

import 'package:flutter_portfolio/design_systems/components/max_container.dart';
import 'package:flutter_portfolio/design_systems/components/label_with_description.dart';
import 'package:flutter_portfolio/utils/breakpoint.dart';

class ApplicationFormsSection extends StatelessWidget {
  const ApplicationFormsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    final forms = [
      _ApplicationForm(
        title: 'Distance Manual Application Forms',
        subtitle: 'Distance Application Form',
        publishedDate: '30/10/2025',
      ),
      _ApplicationForm(
        title: 'Full Time Manual Application Forms',
        subtitle: 'Fulltime Application Form',
        publishedDate: '30/10/2025',
      ),
      _ApplicationForm(
        title: 'Teaching Methodology Manual Application Forms',
        subtitle: 'Teaching Methodology Application Form',
        publishedDate: '15/02/2021',
      ),
      _ApplicationForm(
        title: 'Masters Manual Application Forms',
        subtitle: 'Masters Application Form',
        publishedDate: '15/02/2021',
      ),
      _ApplicationForm(
        title: 'Masters Reference Forms',
        subtitle: 'Masters Reference Form',
        publishedDate: '15/02/2021',
      ),
    ];

    return Column(
      children: [
        /// SECTION TITLE
        LayoutBuilder(
          builder: (context, constraint) {
            final fullWidth = constraint.biggest.width;
            final halfWidth = fullWidth / 1.5;

            final width = breakpoint.largerOrEqualToLaptop
                ? halfWidth
                : fullWidth;

            return Container(
              width: width,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 48),
              child: const LabelWithDescription(
                labelWithDescriptionAlign:
                    LabelWithDescriptionAlign.center,
                title: 'Application Forms',
                subtitle:
                    'Download the appropriate application forms for your programme.',
              ),
            );
          },
        ),

        /// FORMS GRID
        MaxContainer(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isDesktop =
                    breakpoint.largerOrEqualToLaptop;

                final itemWidth = isDesktop
                    ? (constraints.maxWidth / 3) - 32
                    : constraints.maxWidth;

                return Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  children: forms
                      .map(
                        (form) => SizedBox(
                          width: itemWidth,
                          child: ApplicationFormCard(
                            title: form.title,
                            subtitle: form.subtitle,
                            publishedDate:
                                form.publishedDate,
                            onDownload: () {
                              // TODO: download form
                            },
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
class ApplicationFormCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String publishedDate;
  final VoidCallback onDownload;

  const ApplicationFormCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.publishedDate,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// TITLE
            Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color:
                    isDark ? Colors.white : Colors.black87,
              ),
            ),

            const SizedBox(height: 8),

            /// SUBTITLE
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color:
                    isDark ? Colors.white70 : Colors.black54,
              ),
            ),

            const SizedBox(height: 16),

            /// DATE
            Row(
              children: [
                const Icon(
                  Boxicons.bxs_calendar,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(
                  'Date published: $publishedDate',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isDark
                        ? Colors.white60
                        : Colors.black45,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            /// DOWNLOAD BUTTON
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onDownload,
                icon: const Icon(Boxicons.bxs_download),
                label: const Text('Click to Download Form'),
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class _ApplicationForm {
  final String title;
  final String subtitle;
  final String publishedDate;

  _ApplicationForm({
    required this.title,
    required this.subtitle,
    required this.publishedDate,
  });
}
