import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

import 'package:flutter_portfolio/design_systems/components/max_container.dart';
import 'package:flutter_portfolio/design_systems/components/label_with_description.dart';
import 'package:flutter_portfolio/utils/breakpoint.dart';

class ProgrammesSection extends StatelessWidget {
  const ProgrammesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

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
                title: 'Our Programmes',
                subtitle:
                    'Explore our diverse academic schools and flexible postgraduate options.',
              ),
            );
          },
        ),

        /// PROGRAMMES LIST
        MaxContainer(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isDesktop =
                    breakpoint.largerOrEqualToLaptop;

                final columnWidth = isDesktop
                    ? (constraints.maxWidth / 2) - 32
                    : constraints.maxWidth;

                return Column(
                  children: [
                    Wrap(
                      spacing: 32,
                      runSpacing: 32,
                      children: [
                        /// LEFT COLUMN
                        SizedBox(
                          width: columnWidth,
                          child: Column(
                            children: [
                              HoverRowCard(
                                icon: Boxicons.bxs_briefcase,
                                title:
                                    'School of Business Studies',
                                onTap: () {},
                              ),
                              const SizedBox(height: 16),
                              HoverRowCard(
                                icon: Boxicons.bxs_group,
                                title:
                                    'School of Humanities & Social Sciences',
                                onTap: () {},
                              ),
                              const SizedBox(height: 16),
                              HoverRowCard(
                                icon: Boxicons.bxs_flask,
                                title:
                                    'School of Natural Sciences',
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),

                        /// RIGHT COLUMN
                        SizedBox(
                          width: columnWidth,
                          child: Column(
                            children: [
                              HoverRowCard(
                                icon: Boxicons.bxs_graduation,
                                title: 'School of Education',
                                onTap: () {},
                              ),
                              const SizedBox(height: 16),
                              HoverRowCard(
                                icon: Boxicons.bxs_book_open,
                                title:
                                    'Distance Postgraduate Programmes',
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 48),

                    /// CTA BUTTON
                    ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Navigate to application page
                      },
                      icon: const Icon(Boxicons.bxs_edit),
                      label: const Text('Apply Online Now'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 36,
                          vertical: 16,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class HoverRowCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color hoverColor;

  const HoverRowCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.hoverColor = Colors.blue,
  });

  @override
  State<HoverRowCard> createState() => _HoverRowCardState();
}

class _HoverRowCardState extends State<HoverRowCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final defaultColor =
        isDark ? Colors.white70 : Colors.black87;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 22,
                color: _isHovered
                    ? widget.hoverColor
                    : defaultColor,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: _isHovered
                        ? widget.hoverColor
                        : defaultColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
