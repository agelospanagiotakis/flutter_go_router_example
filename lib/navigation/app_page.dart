// ignore_for_file: camel_case_types, constant_identifier_names, unnecessary_this

enum APP_PAGE {
  splash,
  login,
  home,
  error,
  onBoarding,
  qr,
  options,
  help,
  help_help_id,
  settings,
  photos,
  photos_details,
  photos_pageid,
  authors,
  // author_authorId,
  books,
  books_details,
  // books_new,
  // books_all,
  // books_popular,
  // book_bookId,
}

extension AppPageExtension on APP_PAGE {
  String get toPath {
    switch (this) {
      case APP_PAGE.home:
        return "/pages";
      case APP_PAGE.error:
        return "/error";
      case APP_PAGE.qr:
        return '/qr';
      case APP_PAGE.help:
        return '/help';
      case APP_PAGE.help_help_id:
        return 'help_issue/:help_id';
      case APP_PAGE.options:
        return '/options';
      case APP_PAGE.settings:
        return '/settings';
      case APP_PAGE.photos:
        return '/photos';
      case APP_PAGE.photos_details:
        return 'photodetails';
      case APP_PAGE.photos_pageid:
        return '/photos/:page_id';
      case APP_PAGE.books:
        return '/books';
      case APP_PAGE.books_details:
        return 'books_details/:book_id';
      // case APP_PAGE.books_new:
      //   return '/books/new';
      // case APP_PAGE.books_all:
      //   return '/books/all';
      // case APP_PAGE.books_popular:
      //   return '/books/popular';
      // case APP_PAGE.book_bookId:
      //   return '/book/:bookId';

      // case APP_PAGE.authors:
      //   return '/authors';
      // case APP_PAGE.author_authorId:
      //   return '/author/:authorId';
      default:
        return "/pages";
    }
  }

  String get toName {
    return this.toString();
    // switch (this) {
    //   case APP_PAGE.splash:
    //     return "SPLASH";
    //   case APP_PAGE.home:
    //     return "HOME";
    //   case APP_PAGE.login:
    //     return "LOGIN";
    //   case APP_PAGE.error:
    //     return "ERROR";
    //   case APP_PAGE.onBoarding:
    //     return "START";
    //   default:
    //     return "HOME";
    // }
  }

  // String get toTitle {
  //   switch (this) {
  //     case APP_PAGE.home:
  //       return "My App";
  //     case APP_PAGE.login:
  //       return "My App Log In";
  //     case APP_PAGE.splash:
  //       return "My App Splash";
  //     case APP_PAGE.error:
  //       return "My App Error";
  //     case APP_PAGE.onBoarding:
  //       return "Welcome to My App";
  //     default:
  //       return "My App";
  //   }
  // }
}
