import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:znanija_clone/blocs/settings/settings_bloc.dart';
import 'package:znanija_clone/common/theme/borders.dart';

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
                      ? 'AppTheme.darkTheme'
                      : 'AppTheme.lightTheme';

                  return Column(
                    children: [
                      RadioListTile(
                        value: 'AppTheme.lightTheme',
                        groupValue: groupValue,
                        title: const Text("Light theme"),
                        onChanged: (newValue) {
                          context
                              .read<SettingsBloc>()
                              .add(ChangeLightThemeEvent());
                        },
                        activeColor: Colors.greenAccent,
                        selected: false,
                      ),
                      RadioListTile(
                        value: 'AppTheme.darkTheme',
                        groupValue: groupValue,
                        title: const Text("Dark theme"),
                        onChanged: (newValue) {
                          context
                              .read<SettingsBloc>()
                              .add(ChangeDarkThemeEvent());
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
