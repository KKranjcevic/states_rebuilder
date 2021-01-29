import 'package:flutter/material.dart';

import '../../../injected.dart';
import '../../../ui/common/localization/localization.dart';

class StatsCounter extends StatelessWidget {
  const StatsCounter();

  @override
  Widget build(BuildContext context) {
    return activeTodosCount.rebuilder(
      () => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                i18n.of(context).completedTodos,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                '${completedTodosCount.state}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                i18n.of(context).activeTodos,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                '${activeTodosCount.state}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
