import 'package:flutter/material.dart';
import 'package:smarttaskmanager/constants/app_colors.dart';
import 'package:smarttaskmanager/constants/app_font_styles.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;

  final Map<String, int> statusCounts = {
    'Open': 2,
    'In-Progress': 1,
    'Completed': 2,
    'Cancelled': 0,
  };

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        backgroundColor: athens_gray,
        body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width/16,vertical: height/36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height/96,),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hi, Mupaka",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                                color: Colors.black),),
                        Text("Let’s make this day productive",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                color: Colors.black),),
                        SizedBox(height: height/36,),
                        Text("My Tasks",style: osBold.copyWith(fontSize: 24),),
                        SizedBox(height: height/36,),
                        //Add the grid here
                        TaskStatsGridCard(statusCounts: statusCounts),
                      ],
                    ),
                  ),
                ],

              )
            ],
          ),
        ),

      )
    );
  }
}

class TaskStatsGridCard extends StatelessWidget {
  const TaskStatsGridCard({
    super.key,
    required this.statusCounts,
  });

  final Map<String, int> statusCounts;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.2,
      children: statusCounts.entries.map((entry) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blueGrey.shade200),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                entry.key,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 12),
              Text(
                '${entry.value}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
