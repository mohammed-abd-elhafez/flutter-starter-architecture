import 'package:flutter/foundation.dart';

import '../data/dashboard_repository.dart';
import '../domain/dashboard_models.dart';

class DashboardController extends ChangeNotifier {
  DashboardController(this._repository);

  final DashboardRepository _repository;

  DashboardSnapshot? _snapshot;
  bool _isLoading = false;
  String? _errorMessage;

  DashboardSnapshot? get snapshot => _snapshot;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  int get completedItems =>
      _snapshot?.checklist.where((item) => item.completed).length ?? 0;

  double get completionRate {
    final totalItems = _snapshot?.checklist.length ?? 0;
    if (totalItems == 0) return 0;
    return completedItems / totalItems;
  }

  Future<void> load() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _snapshot = await _repository.loadDashboard();
    } catch (_) {
      _errorMessage = 'Unable to load the starter dashboard.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleChecklistItem(String itemId) {
    final currentSnapshot = _snapshot;
    if (currentSnapshot == null) return;

    final updatedChecklist = currentSnapshot.checklist.map((item) {
      if (item.id != itemId) return item;
      return item.copyWith(completed: !item.completed);
    }).toList();

    _snapshot = currentSnapshot.copyWith(checklist: updatedChecklist);
    notifyListeners();
  }
}
