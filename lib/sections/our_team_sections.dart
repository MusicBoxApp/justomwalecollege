import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

import 'package:flutter_portfolio/design_systems/components/max_container.dart';
import 'package:flutter_portfolio/design_systems/components/label_with_description.dart';
import 'package:flutter_portfolio/utils/breakpoint.dart';

class OurTeamSection extends StatelessWidget {
  const OurTeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    final teamMembers = [
      _TeamMember(
        name: 'Dr. John Banda',
        role: 'Vice Chancellor',
        imagePath: 'assets/2.jpg',
      ),
      _TeamMember(
        name: 'Prof. Mary Phiri',
        role: 'Dean of Academics',
        imagePath: 'assets/3.jpg',
      ),
      _TeamMember(
        name: 'Mr. David Mwila',
        role: 'Director of Programmes',
        imagePath: 'assets/4.jpg',
      ),
      _TeamMember(
        name: 'Ms. Ruth Zulu',
        role: 'Student Affairs Officer',
        imagePath: 'assets/1.jpg',
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
                title: 'Our Team',
                subtitle:
                    'Meet the dedicated professionals driving our institution forward.',
              ),
            );
          },
        ),

        /// TEAM GRID
        MaxContainer(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isDesktop =
                    breakpoint.largerOrEqualToLaptop;

                final itemWidth = isDesktop
                    ? (constraints.maxWidth / 4) - 24
                    : (constraints.maxWidth / 2) - 16;

                return Wrap(
                  spacing: 24,
                  runSpacing: 32,
                  alignment: WrapAlignment.center,
                  children: teamMembers
                      .map(
                        (member) => SizedBox(
                          width: itemWidth,
                          child: TeamMemberCard(member: member),
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

class TeamMemberCard extends StatefulWidget {
  final _TeamMember member;

  const TeamMemberCard({
    super.key,
    required this.member,
  });

  @override
  State<TeamMemberCard> createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<TeamMemberCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? (Matrix4.identity()..translate(0, -6))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                /// AVATAR (ASSET IMAGE)
                CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.grey.shade200,
                  child: ClipOval(
                    child: Image.asset(
                      widget.member.imagePath,
                      width: 96,
                      height: 96,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                /// NAME
                Text(
                  widget.member.name,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color:
                        isDark ? Colors.white : Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 6),

                /// ROLE
                Text(
                  widget.member.role,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isDark
                        ? Colors.white70
                        : Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                /// SOCIAL ICONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Boxicons.bxl_linkedin, size: 18),
                    SizedBox(width: 12),
                    Icon(Boxicons.bxl_twitter, size: 18),
                    SizedBox(width: 12),
                    Icon(Boxicons.bxs_envelope, size: 18),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TeamMember {
  final String name;
  final String role;
  final String imagePath;

  _TeamMember({
    required this.name,
    required this.role,
    required this.imagePath,
  });
}
