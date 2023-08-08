import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nested_navigation_gorouter_example/Screens/book_screen.dart';
import 'package:nested_navigation_gorouter_example/Screens/books.dart';

import '../Screens/details_screen.dart';
import '../Screens/help_screen.dart';
import '../Screens/root_screen.dart';
import 'app_page.dart';
import 'scaffold_with_nested_navigation.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorQRKey = GlobalKey<NavigatorState>(debugLabel: 'shell_qr');
final _shellNavigatorPhotosKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell_photos');
final _shellNavigatorOptionsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell_options');
final _shellNavigatorHelpKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell_help');
final _shellNavigatorBooksKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell_books');

// final _booksNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'Books');

final goMyAppRouter = GoRouter(
  initialLocation: '/photos',
  // * Passing a navigatorKey causes an issue on hot reload:
  // * https://github.com/flutter/flutter/issues/113757#issuecomment-1518421380
  // * However it's still necessary otherwise the navigator pops back to
  // * root on hot reload
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    // Stateful navigation based on:
    // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorQRKey,
          routes: [
            GoRoute(
              name: APP_PAGE.qr.toName,
              path: APP_PAGE.qr.toPath,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: RootScreen(label: 'QR', detailsPath: '/qr/details'),
              ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const DetailsScreen(label: 'A'),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorPhotosKey,
          routes: [
            // Shopping Cart
            GoRoute(
              name: APP_PAGE.photos.toName,
              path: APP_PAGE.photos.toPath,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: RootScreen(
                    label: 'photos ', detailsPath: '/photos/photodetails'),
              ),
              routes: [
                GoRoute(
                  path: APP_PAGE.photos_details.toPath,
                  builder: (context, state) =>
                      const DetailsScreen(label: 'photos details'),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHelpKey,
          routes: [
            GoRoute(
              name: APP_PAGE.help.toName,
              path: APP_PAGE.help.toPath,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: RootScreen(
                    label: 'Help', detailsPath: '/help/help_issue/1'),
              ),
              routes: [
                GoRoute(
                  path: APP_PAGE.help_help_id.toPath,
                  builder: (context, state) => HelpScreen(
                      issueId: (state.pathParameters["help_id"] ?? ''),
                      label: 'Help ${state.pathParameters["help_id"]}'),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorOptionsKey,
          routes: [
            GoRoute(
              name: APP_PAGE.options.toName,
              path: APP_PAGE.options.toPath,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: RootScreen(
                    label: 'Options', detailsPath: '/options/option'),
              ),
              routes: [
                GoRoute(
                  path: 'option',
                  builder: (context, state) =>
                      const DetailsScreen(label: 'Option A'),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBooksKey,
          routes: [
            GoRoute(
              name: APP_PAGE.books.toName,
              path: APP_PAGE.books.toPath,
              pageBuilder: (context, state) => const NoTransitionPage(
                // child: RootScreen(
                //     label: 'Books', detailsPath: '/books/books_details/:book_id'),
                child: BooksScreen(),
              ),
              routes: [
                GoRoute(
                    path: APP_PAGE.books_details.toPath,
                    builder: (context, state) {
                      // const Text("ok")
                      String bookId = state.pathParameters['book_id'] ?? '-1';
                      return BookScreen(
                        bookId: (bookId),
                      );
                    }),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
