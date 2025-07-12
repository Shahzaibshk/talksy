import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/images.dart';

class PrimaryHelperAvatar extends StatelessWidget {
  const PrimaryHelperAvatar({
    super.key,
    this.radius,
    this.imageUrl,
    this.image,
    required this.isOnline,
    this.onlineDotWidth,
    this.onlineDotHeight,
  })
  // : assert(
  //        (image != null) != (imageUrl != null || imageUrl == ''),
  //        'Either provide image or imageUrl, not both',
  //      );
  ;
  final double? radius;
  final ImageProvider<Object>? image;
  final String? imageUrl;
  final bool isOnline;
  final double? onlineDotWidth;
  final double? onlineDotHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: radius ?? 24,
          backgroundColor: Colors.grey.shade200,
          child: _buildAvatarContent(),
        ),
        Positioned(
          bottom: 0,
          right: -1,
          child: Container(
            width: onlineDotWidth ?? 12,
            height: onlineDotHeight ?? 12,
            decoration: BoxDecoration(
              color: isOnline ? Colors.green : null,
              shape: BoxShape.circle,
              border: isOnline ? Border.all(color: Colors.white) : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvatarContent() {
    if (image != null) {
      // If an ImageProvider is directly provided, use it
      return ClipOval(
        child: Image(
          image: image!,
          fit: BoxFit.cover,
          width: radius != null ? radius! * 2 : 48,
          height: radius != null ? radius! * 2 : 48,
          errorBuilder: (context, error, stackTrace) {
            return _buildFallbackIcon();
          },
        ),
      );
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      // If an image URL is provided, use CachedNetworkImage
      return ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl!,
          fit: BoxFit.cover,
          width: radius != null ? radius! * 2 : 48,
          height: radius != null ? radius! * 2 : 48,
          placeholder: kImagePlaceHolderSmall,
          errorWidget: (context, url, error) {
            return Image.asset(
              Images.logo,
              fit: BoxFit.cover,
              width: radius != null ? radius! * 2 : 48,
              height: radius != null ? radius! * 2 : 48,
              errorBuilder: (context, error, stackTrace) {
                return _buildFallbackIcon();
              },
            );
          },
        ),
      );
    } else {
      // Fallback icon if neither image nor URL is provided
      return _buildFallbackIcon();
    }
  }

  Widget _buildFallbackIcon() {
    return Icon(Icons.person, color: Colors.grey.shade400);
  }
}
