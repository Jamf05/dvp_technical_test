import 'dart:developer';

import 'package:dvp_technical_test/features/domain/entities/enums/enum_app_version_status.dart';

class UpdateApplicationUtils {
  ///
  /// params:
  ///   - r => remote
  ///   - l => local
  ///
  static AppVersionStatus validateAppVersion(
      {required String? r, required String? l}) {
    if (r == null ||
        l == null ||
        r.isEmpty == true ||
        l.isEmpty == true ||
        r == "null" ||
        l == "null") {
      return AppVersionStatus.invalid;
    }
    List<String> splitRemote = extractSemanticVersion(r)!.split(".");
    List<String> splitLocal = extractSemanticVersion(l)!.split(".");

    AppVersionStatus response = AppVersionStatus.updated;

    if (splitRemote.isEmpty || splitLocal.isEmpty) {
      return AppVersionStatus.invalid;
    }

    if (int.parse(splitLocal[0]) > int.parse(splitRemote[0])) {
      response = AppVersionStatus.updated;
    } else if (int.parse(splitLocal[0]) < int.parse(splitRemote[0])) {
      response = AppVersionStatus.outdated;
    } else {
      if (int.parse(splitLocal[1]) > int.parse(splitRemote[1])) {
        response = AppVersionStatus.updated;
      } else if (int.parse(splitLocal[1]) < int.parse(splitRemote[1])) {
        response = AppVersionStatus.outdated;
      } else {
        if (int.parse(splitLocal[2]) > int.parse(splitRemote[2])) {
          response = AppVersionStatus.updated;
        } else if (int.parse(splitLocal[2]) < int.parse(splitRemote[2])) {
          response = AppVersionStatus.valid;
        } else {
          response = AppVersionStatus.updated;
        }
      }
    }
    log(response.toString(), name: "ValidateAppVersion");
    return response;
  }

  static String? extractSemanticVersion(String? v) {
    if (v == null) return null;
    List<String> split = v.split("-");
    if (split.isEmpty) return null;
    return split[0];
  }

  static int? appVersionToInt(String? v) {
    if (v == null) return 1;
    List<String> split1 = v.split("-");
    if (split1.isNotEmpty) {
      List<String> split2 = split1[0].split(".");
      split2.removeLast();
      if (split2.isNotEmpty) {
        String _v = '';
        for (var e in split2) {
          _v += e;
        }
        return (int.tryParse(_v) ?? 0) * 10;
      }
    }
    return 1;
  }
}
