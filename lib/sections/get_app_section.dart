import 'package:flutter/material.dart';
import 'package:flutter_portfolio/design_systems/components/assets/screenshot_mobile_2.dart';
import 'package:flutter_portfolio/design_systems/components/assets/screenshot_mobile_3.dart';
import 'package:flutter_portfolio/design_systems/components/label_with_description.dart';
import 'package:flutter_portfolio/design_systems/components/max_container.dart';
import 'package:flutter_portfolio/design_systems/components/responsive_row_column.dart';
import 'package:flutter_portfolio/design_systems/typography/text_styles.dart';
import 'package:flutter_portfolio/design_systems/colors/colors.dart';
import 'package:flutter_portfolio/utils/breakpoint.dart';
import 'package:url_launcher/url_launcher.dart';

class GetAppSection extends StatelessWidget {
  const GetAppSection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    return Container(
      width: double.infinity,
      color: AppColors.primary600,
      child: MaxContainer(
        child: SizedBox(
          width: double.infinity,
          child: ResponsiveRowColumn(
            layout: breakpoint.getRowTypeWhenLargerOrEqualTo(Breakpoint.laptop),
            rowSpacing: 32,
            children: const [
              ResponsiveRowColumnItem(rowFit: FlexFit.tight, child: _Description()),
              ResponsiveRowColumnItem(rowFit: FlexFit.tight, child: _Screenshots()),
            ],
          ),
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  const _Description();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelWithDescription(
            title: 'Get In Touch With Us ',
            subtitle:
                'Let us know how we can help you!',
          ),
          const SizedBox(height: 48),
          GestureDetector(
            onTap: () => launchUrl(Uri.parse('tel:0972721111')),
            child: Text(
              'Call: 0972 72 11 11',
              style: AppTextStyles.bodyLargeBold.copyWith(
                color: Colors.white,
                //decoration: TextDecoration.underline, // optional for visual cue
              ),
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () => launchUrl(Uri.parse('tel:0963450188')),
            child: Text(
              'Call: 0963 45 01 88',
              style: AppTextStyles.bodyLargeBold.copyWith(
                color: Colors.white,
                //decoration: TextDecoration.underline, // optional for visual cue
              ),
            ),
          ),
         
          const SizedBox(height: 8),
         // import 'package:url_launcher/url_launcher.dart';

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  final phone = '0972721111';
                  final url = Uri.parse('https://wa.me/260972721111'); // Zambia country code
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    // Handle error
                    debugPrint('Could not launch WhatsApp');
                  }
                },
                child: Text(
                  'WhatsApp: 0972 72 11 11',
                  style: AppTextStyles.bodyLargeBold.copyWith(
                    color: Colors.white,
                    decoration: TextDecoration.underline, // Optional: shows it's clickable
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),
          //const Row(
           // children: [
              //GooglePlayImage(),
             // SizedBox(width: 12),
             // AppStoreImage(),
           // ],
          //),
        ],
      ),
    );
  }
}

class _Screenshots extends StatelessWidget {
  const _Screenshots();

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    if (breakpoint.largerOrEqualToTablet) {
      return const IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: ScreenshotMobile3(),
              ),
            ),
            SizedBox(width: 32),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 160),
                  child: ScreenshotMobile2(),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return const Center(child: Column(children: [ScreenshotMobile3(), ScreenshotMobile2()]));
  }
}
