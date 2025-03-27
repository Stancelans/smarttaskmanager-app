import 'package:flutter/material.dart';
import 'package:smarttaskmanager/views/home/home_view_model.dart';
import 'package:smarttaskmanager/views/home/tabs/home_tab.dart';
import 'package:smarttaskmanager/views/home/tabs/task_tab.dart';
import 'package:stacked/stacked.dart';
import 'package:smarttaskmanager/constants/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final List<Widget> _tabs = [
    const HomeTab(),
    const TaskTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (model) => model.initialize(),
      viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          appBar: AppBar(
            centerTitle: true,
            title: Text("SmartTaskManager", style: TextStyle(color: white),),
            automaticallyImplyLeading: false,
            backgroundColor: persian_blue,
            actions: [],
          ),
          body: Center(
            child: _tabs[model.currentIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: persian_blue,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label:("Home")),
              BottomNavigationBarItem(icon: Icon(Icons.list), label:("Tasks")),
            ],
            currentIndex: model.currentIndex,
            onTap: model.onItemTapped,
            selectedItemColor: white,
            unselectedItemColor: trout,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedIconTheme: const IconThemeData(color: Colors.white, opacity: 1),
            unselectedIconTheme: const IconThemeData(color: trout, opacity: 0.6),
            selectedLabelStyle: const TextStyle(
                color: wood_smoke, fontSize: 12, fontWeight: FontWeight.w800),
            unselectedLabelStyle:
            const TextStyle(color: trout, fontSize: 12, fontWeight: FontWeight.w800),

          ),

        )
    );
  }
}
