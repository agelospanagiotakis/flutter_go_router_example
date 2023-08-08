import 'package:flutter/material.dart';

/// The [DataApiService] holds items in memory, provides a synchronous access
/// to them and notifies listeners when there is any change.
class DataApiService extends ChangeNotifier {
  bool isInit = true;
  bool isLoading = false;

  DataApiService() {
    isInit = false;
  }

  /// After the catalog is disposed, we don't allow it to call
  /// [notifyListeners].

  /// This method initiates.
}
