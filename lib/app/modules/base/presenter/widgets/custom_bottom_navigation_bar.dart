import 'package:flutter/material.dart';

import '../../../../core/services/_services.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final ITabNavigatorService _tabNavigatorService;
  final ITrackListService _trackListService;
  const CustomBottomNavigationBar(
      this._tabNavigatorService, this._trackListService,
      {Key? key})
      : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  void initState() {
    widget._trackListService.addListener(_trackAddedListener);
    super.initState();
  }

  void _trackAddedListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      unselectedItemColor: Theme.of(context).backgroundColor,
      selectedItemColor: Theme.of(context).backgroundColor,
      elevation: 0,
      iconSize: 32,
      onTap: (i) {
        if (i == 1) {
          widget._trackListService.clearTracksAdded();
        }
        widget._tabNavigatorService.goToTab(i);
      },
      currentIndex: widget._tabNavigatorService.currentTab.value,
      items: [
        const BottomNavigationBarItem(
          label: 'Início',
          activeIcon: Icon(Icons.home),
          icon: SizedBox(height: 40, child: Icon(Icons.home_outlined)),
        ),
        BottomNavigationBarItem(
          label: 'Biblioteca',
          activeIcon: const Icon(Icons.library_music),
          icon: Stack(
            children: [
              const SizedBox(
                width: 64,
                height: 40,
                child: Icon(Icons.library_music_outlined),
              ),
              if (widget._trackListService.tracksAdded != 0)
                PositionedDirectional(
                  end: 6,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                    ),
                    child: Center(
                      child: Text(
                        widget._trackListService.tracksAdded.toString(),
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Theme.of(context).backgroundColor),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
