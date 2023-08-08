import 'package:flutter/material.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(label: 'QR Code', icon: Icon(Icons.qr_code)),
          NavigationDestination(label: 'Photos', icon: Icon(Icons.photo_album)),
          NavigationDestination(label: 'Help', icon: Icon(Icons.help)),
          NavigationDestination(label: 'Options', icon: Icon(Icons.settings)),
          NavigationDestination(label: 'Books', icon: Icon(Icons.book))
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
