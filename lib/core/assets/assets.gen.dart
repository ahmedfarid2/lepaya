/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/readme.md
  String get readme => 'assets/animations/readme.md';

  /// List of all assets
  List<String> get values => [readme];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Lato-Black.ttf
  String get latoBlack => 'assets/fonts/Lato-Black.ttf';

  /// File path: assets/fonts/Lato-BlackItalic.ttf
  String get latoBlackItalic => 'assets/fonts/Lato-BlackItalic.ttf';

  /// File path: assets/fonts/Lato-Bold.ttf
  String get latoBold => 'assets/fonts/Lato-Bold.ttf';

  /// File path: assets/fonts/Lato-BoldItalic.ttf
  String get latoBoldItalic => 'assets/fonts/Lato-BoldItalic.ttf';

  /// File path: assets/fonts/Lato-Italic.ttf
  String get latoItalic => 'assets/fonts/Lato-Italic.ttf';

  /// File path: assets/fonts/Lato-Light.ttf
  String get latoLight => 'assets/fonts/Lato-Light.ttf';

  /// File path: assets/fonts/Lato-LightItalic.ttf
  String get latoLightItalic => 'assets/fonts/Lato-LightItalic.ttf';

  /// File path: assets/fonts/Lato-Regular.ttf
  String get latoRegular => 'assets/fonts/Lato-Regular.ttf';

  /// File path: assets/fonts/Lato-Thin.ttf
  String get latoThin => 'assets/fonts/Lato-Thin.ttf';

  /// File path: assets/fonts/Lato-ThinItalic.ttf
  String get latoThinItalic => 'assets/fonts/Lato-ThinItalic.ttf';

  /// List of all assets
  List<String> get values => [
        latoBlack,
        latoBlackItalic,
        latoBold,
        latoBoldItalic,
        latoItalic,
        latoLight,
        latoLightItalic,
        latoRegular,
        latoThin,
        latoThinItalic
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/app_logo.svg
  SvgGenImage get appLogo => const SvgGenImage('assets/icons/app_logo.svg');

  /// File path: assets/icons/no_internet.svg
  SvgGenImage get noInternet =>
      const SvgGenImage('assets/icons/no_internet.svg');

  /// File path: assets/icons/undefined.svg
  SvgGenImage get undefined => const SvgGenImage('assets/icons/undefined.svg');

  /// List of all assets
  List<SvgGenImage> get values => [appLogo, noInternet, undefined];
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
