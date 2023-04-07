import 'package:flutter/material.dart';
import 'package:spacex_grathql_app/core/utils/assets_meneger.dart';
import '../app_text.dart';

class ProfileItemView extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final Function()? onTab;
  final Color? color;
  final String? leading;
  final Widget? trailing;
  const ProfileItemView(
      {super.key,
      this.icon,
      this.trailing,
      this.color,
      this.leading,
      this.title,
      this.onTab});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: onTab,
        trailing: trailing ??
            Icon(
              Icons.chevron_right_rounded,
              color: theme.primaryColor,
              size: 25,
            ),
        title: AppText(
          title ?? "",
          color: theme.primaryColor,
          size: 18,
          fontWeight: FontWeight.w500,
        ),
        leading: Container(
          width: 45,
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18), color: theme.hintColor),
          child: leading != null
              ? Image.asset(
                  AssetsManager.icon(name: leading!),
                  color: theme.primaryColor,
                  width: 25,
                  height: 25,
                )
              : Icon(
                  icon,
                  color: theme.primaryColor,
                ),
        ),
      ),
    );
  }
}
