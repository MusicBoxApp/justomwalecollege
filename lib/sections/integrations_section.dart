import 'package:flutter/material.dart';
import 'package:flutter_portfolio/design_systems/components/assets/integrations_image.dart';
import 'package:flutter_portfolio/design_systems/components/label_with_description.dart';
import 'package:flutter_portfolio/design_systems/components/max_container.dart';
import 'package:flutter_portfolio/design_systems/components/responsive_row_column.dart';
import 'package:flutter_portfolio/utils/breakpoint.dart';

class IntegrationsSection extends StatelessWidget {
  const IntegrationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    double aspectRatio = 0.8;

    if (breakpoint.largerOrEqualToTablet) {
      aspectRatio = 2;
    }

    return MaxContainer(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: ResponsiveRowColumn(
          layout: breakpoint.getRowTypeWhenLargerOrEqualTo(Breakpoint.tablet),
          rowSpacing: 32,
          columnSpacing: 48,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              rowFlex: 4,
              child: _Description(),
            ),
            ResponsiveRowColumnItem(
              rowFit: FlexFit.tight,
              rowFlex: 6,
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: const IntegrationsImage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return const LabelWithDescription(
      title: 'Get the Best and Latest Tech Gadgets and Accessories',
      subtitle:
          'Keep up with the latest in tech! We Stock Nothing but orignal Accessories including Chargers, Headphones and many more.',
    );
  }
}
