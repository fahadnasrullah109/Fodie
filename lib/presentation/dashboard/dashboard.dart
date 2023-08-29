import 'package:flutter/material.dart';
import 'package:fodei/components/bottom_tabs.dart';
import 'package:fodei/components/side_menu.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  final bottomItemHeight = 70.0;

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _selectedIndex = index;
      });
    });
  }

  @override
  void initState() {
    _onItemTapped(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 246),
      body: TabNavigationItem.items[_selectedIndex].page,
      drawer: SideMenu(
        selectedIndex: _selectedIndex,
        onDrawerItemSelected: (int index) {
          Navigator.pop(context);
          _onItemTapped(index);
        },
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 1,
              child: IconButton(
                icon: const Icon(
                  Icons.bar_chart_rounded,
                  color: Colors.black,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 5,
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: widget.bottomItemHeight,
                child: IconButton(
                    onPressed: () {
                      _onItemTapped(0);
                    },
                    icon: _selectedIndex == 0
                        ? TabNavigationItem.items[0].selectedIcon
                        : TabNavigationItem.items[0].unSelectedIcon),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: widget.bottomItemHeight,
                child: IconButton(
                    onPressed: () {
                      _onItemTapped(1);
                    },
                    icon: _selectedIndex == 1
                        ? TabNavigationItem.items[1].selectedIcon
                        : TabNavigationItem.items[1].unSelectedIcon),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: widget.bottomItemHeight,
                child: IconButton(
                    onPressed: () {
                      _onItemTapped(2);
                    },
                    icon: _selectedIndex == 2
                        ? TabNavigationItem.items[2].selectedIcon
                        : TabNavigationItem.items[2].unSelectedIcon),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
