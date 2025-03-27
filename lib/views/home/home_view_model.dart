
import 'package:flutter/material.dart';
import 'package:smarttaskmanager/views/app_base_view_model.dart';
import 'package:smarttaskmanager/views/home/tabs/home_tab.dart';
import 'package:smarttaskmanager/views/home/tabs/task_tab.dart';

class HomeViewModel extends AppBaseViewModel {

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  Future<void> initialize() async {
    debugPrint('HomeViewModel.initialize');
  }

  void onItemTapped(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}