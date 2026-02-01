import 'package:flutter/material.dart';
import 'package:flutter_portfolio/main_notifier.dart';
import 'package:flutter_portfolio/sections/access_section.dart';
import 'package:flutter_portfolio/sections/application_sections.dart';
import 'package:flutter_portfolio/sections/companies_sections.dart';
import 'package:flutter_portfolio/design_systems/typography/text_styles.dart';
import 'package:flutter_portfolio/sections/features_section.dart';
import 'package:flutter_portfolio/sections/footer_section.dart';
import 'package:flutter_portfolio/sections/gallery_sections.dart';
import 'package:flutter_portfolio/sections/get_app_section.dart';
import 'package:flutter_portfolio/sections/integrations_section.dart';
import 'package:flutter_portfolio/sections/main_section.dart';
import 'package:flutter_portfolio/sections/our_team_sections.dart';
import 'package:flutter_portfolio/sections/programms_sections.dart';
import 'package:flutter_portfolio/sections/stories_section.dart';
import 'package:flutter_portfolio/design_systems/colors/colors.dart';
import 'package:flutter_portfolio/shared/navigation_bar.dart';
import 'package:flutter_portfolio/utils/breakpoint.dart';
import 'package:flutter_portfolio/utils/constants.dart';
import 'package:flutter_portfolio/utils/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Justo Mwale College',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => LayoutBuilder(
        builder: (context, constraint) {
          return BreakpointProvider(
            breakpoint: Breakpoint.get(constraint.maxWidth),
            child: child!,
          );
        },
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary600),
        useMaterial3: true,
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primary600,
            minimumSize: const Size(0, 56),
            textStyle: AppTextStyles.bodyMediumSemiBold,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            foregroundColor: Colors.white,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            minimumSize: const Size(0, 56),
            textStyle: AppTextStyles.bodyMediumSemiBold,
            foregroundColor: AppColors.primary600,
          ),
        ),
      ),
      home: Provider(
        notifier: MainNotifier(),
        child: const LandingPage(),
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final notifier = Provider.of<MainNotifier>(context);
      notifier.onScrollOffsetChanged(_scrollController.offset);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(Constants.kNavigationBarHeight),
          child: NavBar(),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: const Column(
            children: [
              MainSection(),
              CompaniesSections(),
              GallerySection(),
              ProgrammesSection(),
              ApplicationFormsSection(),
              OurTeamSection(),
              GetAppSection(),
              FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}
