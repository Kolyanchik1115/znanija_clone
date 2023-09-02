import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/core/enums/theme_type.dart';
import 'package:znanija_clone/presentation/blocs/settings/settings_bloc.dart';

Future<void> showThemeDialog(BuildContext context) async {
  await showDialog(
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    context: context,
    builder: (context) {
      return Center(
        child: Wrap(
          children: [
            AlertDialog(
              content: BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  String groupValue = state.theme == AppTheme.darkTheme
                      ? AppTheme.darkTheme.name
                      : AppTheme.lightTheme.name;
                  return Column(
                    children: [
                      RadioListTile(
                        value: AppTheme.lightTheme.name,
                        groupValue: groupValue,
                        title: const Text("Light theme"),
                        onChanged: (newValue) {
                          context.read<SettingsBloc>().add(
                              const ChangeThemeEvent(
                                  theme: AppTheme.lightTheme));
                        },
                        activeColor: Colors.greenAccent,
                        selected: false,
                      ),
                      RadioListTile(
                        value: AppTheme.darkTheme.name,
                        groupValue: groupValue,
                        title: const Text("Dark theme"),
                        onChanged: (newValue) {
                          context.read<SettingsBloc>().add(
                              const ChangeThemeEvent(
                                  theme: AppTheme.darkTheme));
                        },
                        activeColor: Colors.black,
                        selected: false,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}
