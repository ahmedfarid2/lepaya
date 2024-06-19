import 'package:lepaya/core/utils/enums.dart';
import 'package:lepaya/core/utils/helpers/app_alert.dart';
import 'package:lepaya/core/utils/helpers/error_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperUrlLauncher {
  static Future<void> launchPost(String url) async {
    try {
      if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
        AppAlert.error('Could not launch Post Url');
      }
    } catch (e, stackTrace) {
      ErrorHelper.printDebugError(
        message: 'Error Could not launch Post Url',
        level: ErrorLevels.ERROR,
        name: 'HelperUrlLauncher.launchPost',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
