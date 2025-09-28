import 'package:flutter/material.dart';
import '../../../core/design_system/screen_sizes.dart';
import '../../../core/design_system/app_spacing.dart';
import '../../../core/design_system/app_typography.dart';

/// Simple skeleton loading widget without external shimmer dependency
/// Uses built-in Flutter animations for shimmer effect
class ResponsiveProductCardSkeleton extends StatefulWidget {
  const ResponsiveProductCardSkeleton({super.key});

  @override
  State<ResponsiveProductCardSkeleton> createState() =>
      _ResponsiveProductCardSkeletonState();
}

class _ResponsiveProductCardSkeletonState
    extends State<ResponsiveProductCardSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenType = ScreenSizes.getScreenType(context);
    final imageHeight = _getSkeletonImageHeight(screenType);

    return Card(
      elevation: _getElevation(screenType),
      margin: EdgeInsets.all(
        AppSpacing.responsive(
          context,
          mobile: AppSpacing.xs,
          tablet: AppSpacing.sm,
          desktop: AppSpacing.md,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_getBorderRadius(screenType)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Skeleton image
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) => Container(
              height: imageHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.lerp(
                  Colors.grey[300]!,
                  Colors.grey[100]!,
                  _animation.value,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(_getBorderRadius(screenType)),
                ),
              ),
            ),
          ),

          // Skeleton content
          Expanded(
            child: Padding(
              padding: AppSpacing.cardPadding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand skeleton
                  _buildAnimatedLine(
                    context,
                    width: 0.4,
                    height: AppTypography.captionSize(context),
                  ),
                  SizedBox(height: AppSpacing.xs / 2),

                  // Title skeleton
                  _buildAnimatedLine(
                    context,
                    width: 0.9,
                    height: AppTypography.titleSize(context),
                  ),
                  SizedBox(height: AppSpacing.xs / 2),
                  _buildAnimatedLine(
                    context,
                    width: 0.7,
                    height: AppTypography.titleSize(context),
                  ),

                  SizedBox(height: AppSpacing.xs),

                  // Rating skeleton
                  Row(
                    children: [
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) => Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: Color.lerp(
                              Colors.grey[300]!,
                              Colors.grey[100]!,
                              _animation.value,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(width: AppSpacing.xs / 2),
                      _buildAnimatedLine(
                        context,
                        width: 0.2,
                        height: AppTypography.captionSize(context),
                      ),
                    ],
                  ),

                  Spacer(),

                  // Price skeleton
                  _buildAnimatedLine(
                    context,
                    width: 0.3,
                    height: AppTypography.priceSize(context),
                  ),

                  // Action buttons skeleton (only on larger screens)
                  if (_shouldShowActionButtons(screenType))
                    Padding(
                      padding: EdgeInsets.only(top: AppSpacing.sm),
                      child: Row(
                        children: [
                          Expanded(
                            child: AnimatedBuilder(
                              animation: _animation,
                              builder: (context, child) => Container(
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Color.lerp(
                                    Colors.grey[300]!,
                                    Colors.grey[100]!,
                                    _animation.value,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: AppSpacing.xs),
                          AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) => Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Color.lerp(
                                  Colors.grey[300]!,
                                  Colors.grey[100]!,
                                  _animation.value,
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedLine(
    BuildContext context, {
    required double width,
    required double height,
  }) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Container(
        height: height,
        width: MediaQuery.of(context).size.width * width,
        decoration: BoxDecoration(
          color: Color.lerp(
            Colors.grey[300]!,
            Colors.grey[100]!,
            _animation.value,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  double _getSkeletonImageHeight(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.mobile:
        return 120.0;
      case ScreenType.largeMobile:
        return 140.0;
      case ScreenType.tablet:
        return 160.0;
      case ScreenType.desktop:
        return 180.0;
      case ScreenType.largeDesktop:
        return 200.0;
    }
  }

  double _getElevation(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.mobile:
      case ScreenType.largeMobile:
        return 2.0;
      default:
        return 4.0;
    }
  }

  double _getBorderRadius(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.mobile:
        return 8.0;
      case ScreenType.largeMobile:
        return 10.0;
      default:
        return 12.0;
    }
  }

  bool _shouldShowActionButtons(ScreenType screenType) {
    return screenType != ScreenType.mobile &&
        screenType != ScreenType.largeMobile;
  }
}

class ResponsiveProductGridSkeleton extends StatelessWidget {
  final int itemCount;

  const ResponsiveProductGridSkeleton({super.key, this.itemCount = 10});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = ScreenSizes.getGridColumns(context);
        final spacing = AppSpacing.gridSpacing(context);
        final aspectRatio = ScreenSizes.getCardAspectRatio(context);

        return Padding(
          padding: AppSpacing.screenMargin(context),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              childAspectRatio: aspectRatio,
              crossAxisSpacing: spacing,
              mainAxisSpacing: spacing,
            ),
            itemCount: itemCount,
            itemBuilder: (context, index) =>
                const ResponsiveProductCardSkeleton(),
          ),
        );
      },
    );
  }
}
