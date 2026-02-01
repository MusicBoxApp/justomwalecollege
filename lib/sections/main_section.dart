import 'package:flutter/material.dart';
import 'package:flutter_portfolio/design_systems/components/assets/landing_main_background.dart';
import 'package:flutter_portfolio/design_systems/components/label_with_description_white.dart';
import 'package:flutter_portfolio/design_systems/components/responsive_row_column.dart';
import 'package:flutter_portfolio/design_systems/components/max_container.dart';
import 'package:flutter_portfolio/utils/breakpoint.dart';
import 'package:flutter_portfolio/utils/constants.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        LandingMainBackground(),
        MaxContainer(child: MainContent()),
      ],
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 72 + (Constants.kNavigationBarHeight / 2)),
      child: ResponsiveRowColumn(
        layout: breakpoint.getRowTypeWhenLargerOrEqualTo(Breakpoint.laptop),
        columnSpacing: 72,
        children: const [
          ResponsiveRowColumnItem(
            rowFit: FlexFit.tight,
            rowFlex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelWithDescription(
                  title: 'Welcome to Justo Mwale College',
                  subtitle:
                      'The institution was opened in 1967, as Kabwe Teachers Training College. It trained Junior Secondary School Teachers at its inception. Four years later, the President of Zambia at the time, Kenneth Kaunda, renamed the college Nkrumah Teachers College, in honor of Kwame Nkrumah, the founding president of Ghana.',
                  labelWithDescriptionType: LabelWithDescriptionType.heading,
                ),
                SizedBox(height: 32),
               // _InstructionButtons(),
              ],
            ),
          ),
          ResponsiveRowColumnItem(
            rowFit: FlexFit.tight,
            rowFlex: 5, 
            child: SizedBox(
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
