import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

import 'package:flutter_portfolio/design_systems/components/max_container.dart';
import 'package:flutter_portfolio/design_systems/components/label_with_description.dart';
import 'package:flutter_portfolio/utils/breakpoint.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    final breakpoint = BreakpointProvider.of(context);

    /// LOCAL ASSET IMAGES
    final galleryImages = [
      'assets/6.jpg',
      'assets/7.jpg',
      'assets/8.jpg',
      'assets/9.jpg',
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
              margin: const EdgeInsets.only(bottom: 32),
              child: const LabelWithDescription(
                labelWithDescriptionAlign:
                    LabelWithDescriptionAlign.center,
                title: 'Gallery',
                subtitle:
                    'A glimpse into campus life and student activities.',
              ),
            );
          },
        ),

        /// IMAGE ROW
        MaxContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: galleryImages.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(width: 24),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 320,
                    child: GalleryImageCard(
                      imagePath: galleryImages[index],
                      onTap: () {
                        // TODO: open image viewer / dialog
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),

        const SizedBox(height: 32),

        /// SEE MORE BUTTON
        TextButton.icon(
          onPressed: () {
            // TODO: navigate to full gallery page
          },
          icon: const Icon(Boxicons.bxs_image),
          label: const Text('See more photos'),
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class GalleryImageCard extends StatefulWidget {
  final String imagePath;
  final VoidCallback onTap;

  const GalleryImageCard({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  State<GalleryImageCard> createState() =>
      _GalleryImageCardState();
}

class _GalleryImageCardState extends State<GalleryImageCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Stack(
            fit: StackFit.expand,
            children: [
              /// IMAGE (ASSET)
              AnimatedScale(
                scale: _isHovered ? 1.05 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.cover,
                ),
              ),

              /// HOVER OVERLAY
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _isHovered ? 1 : 0,
                child: Container(
                  color: Colors.black.withOpacity(0.45),
                  child: const Center(
                    child: Icon(
                      Boxicons.bx_zoom_in,
                      size: 36,
                      color: Colors.white,
                    ),
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
