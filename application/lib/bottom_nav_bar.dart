import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar(
      {required this.initialUrl, required this.controller, Key? key})
      : super(key: key);

  final WebViewController controller;
  final String initialUrl;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedBottomNavItem = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedBottomNavItem,
      selectedItemColor: Theme.of(context).primaryColor,
      onTap: (int index) => _onBottomNavItemTapped(index),
      items: const [
        BottomNavigationBarItem(
          label: 'Back',
          icon: Icon(Icons.arrow_back_ios),
        ),
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Forward',
          icon: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }

  void _onBottomNavItemTapped(int index) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    switch (index) {
      case 0:
        _goBack();
        break;
      case 1:
        _goHome();
        break;
      case 2:
        _goForward();
        break;
    }
    setState(() => _selectedBottomNavItem = index);
  }

  void _goHome() {
    widget.controller.loadRequest(Uri.parse(widget.initialUrl));
  }

  Future<void> _goBack() async {
    if (await widget.controller.canGoBack()) {
      await widget.controller.goBack();
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No back history item')),
        );
      }
    }
  }

  Future<void> _goForward() async {
    if (await widget.controller.canGoForward()) {
      await widget.controller.goForward();
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No forward history item')),
        );
      }
    }
  }
}
