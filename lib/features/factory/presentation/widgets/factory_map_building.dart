import 'package:flutter/material.dart';
import 'package:farm_game/core/constants/app_assets.dart';
import 'package:farm_game/core/constants/app_colors.dart';
import 'package:farm_game/core/constants/app_dimens.dart';
import 'package:farm_game/core/theme/app_text_styles.dart';
import 'package:farm_game/features/factory/domain/models/factory_building.dart';

/// A widget that displays a factory building on the map.
///
/// Supports both local PNG assets and network GIF images.
/// When tapped, it can navigate to the building's detail screen.
class FactoryMapBuilding extends StatelessWidget {
  final FactoryBuilding building;
  final VoidCallback? onTap;
  final bool showLabel;

  const FactoryMapBuilding({
    super.key,
    required this.building,
    this.onTap,
    this.showLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Building image
          SizedBox(
            width: building.width,
            height: building.height,
            child: _buildBuildingImage(),
          ),
          // Label
          if (showLabel) ...[
            const SizedBox(height: AppDimens.paddingXs),
            _buildLabel(),
          ],
        ],
      ),
    );
  }

  Widget _buildBuildingImage() {
    if (building.isNetworkGif && building.networkGifUrl != null) {
      return _buildNetworkImage(building.networkGifUrl!);
    } else if (building.isLocalAsset && building.localAsset != null) {
      return _buildLocalImage(building.localAsset!);
    }

    // Fallback to placeholder
    return _buildPlaceholder();
  }

  Widget _buildLocalImage(String assetPath) {
    return Image.asset(
      assetPath,
      width: building.width,
      height: building.height,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return _buildPlaceholder();
      },
    );
  }

  Widget _buildNetworkImage(String url) {
    return Image.network(
      url,
      width: building.width,
      height: building.height,
      fit: BoxFit.contain,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return _buildLoadingIndicator(loadingProgress);
      },
      errorBuilder: (context, error, stackTrace) {
        // Fallback to local asset if network fails and local asset exists
        if (building.localAsset != null) {
          return _buildLocalImage(building.localAsset!);
        }
        return _buildPlaceholder();
      },
    );
  }

  Widget _buildLoadingIndicator(ImageChunkEvent loadingProgress) {
    final progress = loadingProgress.expectedTotalBytes != null
        ? loadingProgress.cumulativeBytesLoaded /
            loadingProgress.expectedTotalBytes!
        : null;

    return Container(
      width: building.width,
      height: building.height,
      decoration: BoxDecoration(
        color: AppColors.panelBackground.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
      ),
      child: Center(
        child: SizedBox(
          width: AppDimens.iconLg,
          height: AppDimens.iconLg,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 3.0,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: building.width,
      height: building.height,
      decoration: BoxDecoration(
        color: AppColors.panelBackground.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        border: Border.all(
          color: AppColors.panelBorder.withValues(alpha: 0.5),
          width: 2.0,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.factory_outlined,
          size: AppDimens.iconXl,
          color: AppColors.panelBorder.withValues(alpha: 0.5),
        ),
      ),
    );
  }

  Widget _buildLabel() {
    return SizedBox(
      width: building.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Name card background
          SizedBox(
            width: 70,
            child: Image.asset(
              AppAssets.nameCard,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                // Fallback to simple container if name card image fails
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.paddingSm,
                    vertical: AppDimens.paddingXs,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.panelBackground,
                    borderRadius: BorderRadius.circular(AppDimens.radiusSm),
                    border: Border.all(
                      color: AppColors.panelBorder,
                      width: 1.0,
                    ),
                  ),
                );
              },
            ),
          ),
          // Label text
          Padding(
            padding: const EdgeInsets.only(top: AppDimens.paddingSm),
            child: Text(
              building.name,
              style: AppTextStyles.labelverySmall,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
