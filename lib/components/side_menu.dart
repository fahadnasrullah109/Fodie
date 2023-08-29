import 'package:flutter/material.dart';
import 'package:fodei/components/bottom_tabs.dart';

class SideMenu extends StatefulWidget {
  const SideMenu(
      {super.key,
      required this.selectedIndex,
      required this.onDrawerItemSelected});

  final int selectedIndex;
  final Function(int index) onDrawerItemSelected;

  @override
  State<StatefulWidget> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
          itemCount: TabNavigationItem.items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: widget.selectedIndex == index
                  ? TabNavigationItem.items[index].selectedIcon
                  : TabNavigationItem.items[index].unSelectedIcon,
              title: Text(
                TabNavigationItem.items[index].title,
                style: TextStyle(
                  color: widget.selectedIndex == index
                      ? const Color.fromARGB(255, 50, 183, 104)
                      : const Color.fromARGB(255, 75, 85, 99),
                ),
              ),
              onTap: () {
                widget.onDrawerItemSelected(index);
              },
            );
          }),
    );
  }
}
