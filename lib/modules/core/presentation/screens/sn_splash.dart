import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lepaya/core/assets/assets.gen.dart';
import 'package:lepaya/core/constants/constants.dart';
import 'package:lepaya/core/services/routes/routes_names.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SNSplash extends StatefulWidget {
  const SNSplash({super.key});

  @override
  State<SNSplash> createState() => _SNSplashState();
}

class _SNSplashState extends State<SNSplash> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.repeat(reverse: true);

    Future.delayed(
      const Duration(seconds: 1),
      () async {
        final PackageInfo packageInfo = await PackageInfo.fromPlatform();
        Constants.constValues.appVersion = packageInfo.version;

        Modular.to.navigate(
          RoutesNames.post.retrievePosts,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value,
                child: Center(
                  child: SvgPicture.asset(
                    Assets.icons.appLogo.path,
                    width: 236.w,
                    height: 74.h,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
