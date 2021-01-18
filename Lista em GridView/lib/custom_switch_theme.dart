import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_controller.dart';

class CurstomSwitchTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        secondary: const Icon(Icons.lightbulb_outline),
        title:
            Text('Change Theme', style: Theme.of(context).textTheme.subtitle1),
        value: AppController.instance.isDarkTheme,
        onChanged: (value) => AppController.instance.changeTheme());
  }
}
