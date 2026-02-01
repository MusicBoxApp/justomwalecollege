import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_portfolio/design_systems/components/assets/feature_better_components_image.dart';
import 'package:flutter_portfolio/design_systems/components/assets/feature_flexibility_image.dart';
import 'package:flutter_portfolio/design_systems/components/assets/feature_multiple_layout_image.dart';
import 'package:flutter_portfolio/design_systems/components/assets/feature_robust_workflow_image.dart';
import 'package:flutter_portfolio/design_systems/components/assets/feature_user_friendly_image.dart';
import 'package:flutter_portfolio/design_systems/components/assets/feature_well_organised_image.dart';
import 'package:flutter_portfolio/design_systems/components/label_with_description.dart';
import 'package:flutter_portfolio/design_systems/components/max_container.dart';
import 'package:flutter_portfolio/design_systems/typography/text_styles.dart';
import 'package:flutter_portfolio/design_systems/colors/colors.dart';
import 'package:flutter_portfolio/utils/breakpoint.dart';

import 'package:flutter_portfolio/design_systems/components/assets/dynamic_image.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    int featuresLength = 6;
    int columnSizes = 1;
    int rowSizes = featuresLength;

    if (breakpoint.equals(Breakpoint.desktop)) {
      columnSizes = 3;
      rowSizes = featuresLength ~/ columnSizes;
    } else if (breakpoint.largerThanLaptop) {
      columnSizes = 2;
      rowSizes = featuresLength ~/ columnSizes;
    }

    return MaxContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 96),
        child: Column(
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
                    title: 'Gallery',
                    subtitle:
                        '',
                  ),
                );
              },
            ),
            LayoutGrid(
              rowSizes: List.generate(rowSizes, (_) => auto),
              columnSizes: List.generate(columnSizes, (_) => auto),
              rowGap: 84,
              children: const [
				  _FeatureItem(
					title: 'Tech Accessories',
					description: 'Keep up with the latest in tech! We stock nothing but original accessories including chargers, headphones and many more.',
					icon: FeatureRobustWorkflowImage(),
					image: 'assets/integrations.png', 
				  ),
				  _FeatureItem(
					title: 'Security Systems Installation',
					description: 'Keep what you treasure the most safe! Get our team to install and maintain quality security systems including CCTV and security lights.',
					icon: FeatureFlexibilityImage(),
					image: "assets/integrations3.png",
				  ),
				  _FeatureItem(
					title: 'Live GPS Tracking',
					description: 'Track your vehicles or loved ones in real-time! Our GPS solutions offer accurate location updates, route history, and geo-fencing alerts to ensure peace of mind.',
					icon: FeatureUserFriendlyImage(),
					image: "assets/15.png",
				  ),
				  _FeatureItem(
					title: 'Software Installation',
					description: 'From operating systems to specialized software, our team ensures secure, smooth, and up-to-date installations for all your devices—whether for personal or business use.',
					icon: FeatureMultipleLayoutsImage(),
					image: "assets/12.jpg",
				  ),
				],

            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  const _FeatureItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.image,
  });

  final String title;

  final String description;

  final Widget icon;

  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(height: 24),
             DynamicImage(image: image,),
             const SizedBox(height: 24),
            Text(
              title,
              style: AppTextStyles.displaySmallBold.copyWith(color: AppColors.neutral900),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: AppTextStyles.bodyMediumRegular.copyWith(color: AppColors.neutral700),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}