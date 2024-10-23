part of '../theme_section.dart';

class ThemeModeSettingTile extends ConsumerWidget {
  const ThemeModeSettingTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider).themeMode;

    const listThemeIcons = [
      Icon(Icons.color_lens),
      Icon(Icons.light_mode),
      Icon(Icons.dark_mode),
    ];

    return SettingsTile(
      title: S.of(context).switchTheme,
      leading: listThemeIcons[themeMode.index],
      trailing: DropdownButton<ThemeMode>(
        value: themeMode,
        underline: const SizedBox.shrink(),
        onChanged: (value) {
          if (value == null) return;
          ref.watch(themeNotifierProvider.notifier).setThemeMode(value);
        },
        items: [
          DropdownMenuItem(
            value: ThemeMode.system,
            child: Text(ThemeMode.system.name.titleCase),
          ),
          DropdownMenuItem(
            value: ThemeMode.light,
            child: Text(ThemeMode.light.name.titleCase),
          ),
          DropdownMenuItem(
            value: ThemeMode.dark,
            child: Text(ThemeMode.dark.name.titleCase),
          ),
        ],
      ),
    );
  }
}
