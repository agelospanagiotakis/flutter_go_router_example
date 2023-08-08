import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get_it/get_it.dart';
import 'package:nested_navigation_gorouter_example/API/library.dart';

import 'my_app.dart';

final getIt = GetIt.instance;

void main() {
  // turn off the # in the URLs on the web
  getIt.registerSingleton<Library>(Library());
  // use it as
  WidgetsFlutterBinding.ensureInitialized();

  getIt<Library>().loadAuthorsFromJson();
  getIt<Library>().loadBooksFromJson();

  usePathUrlStrategy();
  runApp(const MyApp());
}

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
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
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            elevation: 3,
            useIndicator: true,
            backgroundColor: Colors.white,
            indicatorColor: Colors.blue,
            // leading
            // trailing:
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                label: Text('QR Code'),
                icon: Icon(Icons.qr_code),
              ),
              NavigationRailDestination(
                label: Text('Photos'),
                icon: Icon(Icons.photo_album),
              ),
              NavigationRailDestination(
                label: Text('Help'),
                icon: Icon(Icons.help),
              ),
              NavigationRailDestination(
                label: Text('Options'),
                icon: Icon(Icons.settings),
              ),
              NavigationRailDestination(
                label: Text('Books'),
                icon: Icon(Icons.book),
              )
              // NavigationRailDestination(
              //   label: Text('Section A'),
              //   icon: Icon(Icons.home),
              // ),
              // NavigationRailDestination(
              //   label: Text('Section B'),
              //   icon: Icon(Icons.settings),
              // ),
            ],
          ),
          const VerticalDivider(thickness: 10, width: 2),
          // This is the main content.
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
