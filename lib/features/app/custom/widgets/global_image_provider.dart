import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dvp_technical_test/core/settings/app_settings.dart';
import 'package:dvp_technical_test/core/validators/image_validator.dart';
import 'package:dvp_technical_test/features/app/custom/widgets/circular_progress_indicator_widget.dart';

class GlobalImageProvider extends StatelessWidget {
  final String? url;
  final String? placeholder;
  final String? errorHolder;
  final double? width;
  final double? height;
  final Color? svgColor;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BoxFit? fit;
  final Widget? widgetHolder;

  const GlobalImageProvider(
      this.url,
      {super.key,
      this.placeholder,
      this.width,
      this.height,
      this.svgColor,
      this.margin,
      this.padding,
      this.fit,
      this.errorHolder,
      this.widgetHolder =
          const CircularProgressWidget(color: AppColors.greySecond)});

  @override
  Widget build(BuildContext context) {
    return _buildImage(
      url: url,
      placeholder: placeholder,
      errorHolder: errorHolder,
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      fit: fit,
    );
  }

  Widget _buildImage({
    required String? url,
    String? placeholder,
    String? errorHolder,
    double? width,
    double? height,
    EdgeInsets? margin,
    EdgeInsets? padding,
    BoxFit? fit,
  }) {
    Uri uri = ValidateImage.network(url ?? '');
    if (uri.isAbsolute) {
      return _buildNetworkImage(uri, width, height, fit, placeholder);
    } else {
      switch (uri.toString().split('.').last) {
        case 'svg':
          return _buildSvgImage(uri.toString(), width, height, fit);
        case 'png':
        case 'jpg':
        case 'jpeg':
          return _buildAssetImage(uri.toString(), width, height, fit);
        default:
          return const SizedBox();
      }
    }
  }

  Widget _buildHolder(
      {required String? url,
      double? width,
      double? height,
      EdgeInsets? margin,
      EdgeInsets? padding,
      BoxFit? fit}) {
    switch (url.toString().split('.').last) {
      case 'svg':
        return _buildSvgImage(url.toString(), width, height, fit);
      case 'png':
      case 'jpg':
      case 'jpeg':
        return _buildAssetImage(url.toString(), width, height, fit);
      default:
        if (widgetHolder != null) return widgetHolder!;
        return const SizedBox();
    }
  }

  Widget _buildNetworkImage(
    Uri? uri,
    double? width,
    double? height,
    BoxFit? fit,
    String? placeholder,
  ) {
    String? ph = placeholder;
    switch (url.toString().split('.').last) {
      case 'svg':
        return url != null
            ? SvgPicture.network(
                url!,
                color: svgColor,
                height: height,
                width: width,
                placeholderBuilder: (_) => _buildHolder(
                  url: ph,
                  width: width,
                  height: height,
                  margin: margin,
                  padding: padding,
                  fit: fit,
                ),
              )
            : const SizedBox();
      case 'png':
      case 'jpg':
      case 'jpeg':
        return CachedNetworkImage(
          imageUrl: uri.toString(),
          width: width,
          height: height,
          fit: fit ?? BoxFit.cover,
          errorWidget: (_, __, ___) => _buildHolder(
            url: ph,
            width: width,
            height: height,
            margin: margin,
            padding: padding,
            fit: fit,
          ),
          placeholder: (_, __) => _buildHolder(
            url: ph,
            width: width,
            height: height,
            margin: margin,
            padding: padding,
            fit: fit,
          ),
          // loadingBuilder: (BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
          //   if (loadingProgress == null) return child;
          //   else return _buildHolder(
          //     url: ph,
          //     width: width,
          //     height: height,
          //     widthContainer: widthContainer,
          //     heightContainer: heightContainer,
          //     backgroundColor: backgroundColor,
          //     margin: margin,
          //     padding: padding,
          //     fit: fit,
          //   );
          // }
        );
      default:
        return Container();
    }
  }

  Widget _buildSvgImage(
      String? imagen, double? width, double? height, BoxFit? fit) {
    if (imagen == null) return const SizedBox();
    return SvgPicture.asset(
      imagen,
      fit: fit ?? BoxFit.fitHeight,
      width: width,
      height: height,
      color: svgColor,
    );
  }

  Widget _buildAssetImage(
    String? imagen,
    double? width,
    double? height,
    BoxFit? fit,
  ) {
    if (imagen == null) return const SizedBox();
    return Image(
      image: AssetImage(imagen),
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
    );
  }
}
