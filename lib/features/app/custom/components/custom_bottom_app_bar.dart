import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dvp_technical_test/core/env.dart';
import 'package:dvp_technical_test/core/page/base_stateless.dart';
import 'package:dvp_technical_test/core/settings/app_settings.dart';
import 'package:package_info_plus/package_info_plus.dart';

class CustomBottomAppBar extends BaseStateless {
  const CustomBottomAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BaseStateless.init(context);
    return BottomAppBar(
        child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            Assets.icons.home,
            width: 20.0,
            color: AppColors.goldFirst,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            Assets.icons.heart,
            width: 20.0,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            Assets.icons.search,
            width: 20.0,
          ),
          onPressed: () {},
        ),
        IconButton(
            icon: SvgPicture.asset(
              Assets.icons.question,
              width: 20.0,
            ),
            onPressed: () async {
              Show.of(context).dialog(
                  title: l10n.aboutApp,
                  useSingleAction: true,
                  message:
                      "${l10n.version} ${Env.version} (${Env.releaseDate}) \n ${l10n.appCreatedAt}");
            }),
      ],
    ));
  }
}
