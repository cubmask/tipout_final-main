import 'package:flutter/material.dart';

class BottomNavigationBarAdaptive extends StatelessWidget {
  final int currentIndex;
  final List<BottomNavigationBarItem> items;
  final ValueChanged<int> onItemSelected;

  const BottomNavigationBarAdaptive({
    super.key,
    this.currentIndex = 0,
    required this.items,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: const Color(0xff4BCD3E),
      unselectedItemColor: Theme.of(context).textTheme.bodyText1?.color,
      onTap: onItemSelected,
      currentIndex: currentIndex,
      items: items,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    );
  }
}
