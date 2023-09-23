import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herogames_ui2/pages/homepage.dart';
import 'package:herogames_ui2/pages/profile.dart';
import 'package:herogames_ui2/pages/statistics.dart';
import 'package:herogames_ui2/pages/unknown.dart';

import 'cubit/main_cubit.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<Widget> allPages;
  late HomePage homePage;
  late UnknownPage unknownPage;
  late StatisticsPage statisticsPage;
  late ProfilePage profilePage;
  late MainCubit mainCubit;

  @override
  void initState() {
    super.initState();
    mainCubit = BlocProvider.of<MainCubit>(context);
    homePage = HomePage(
      mainCubit: mainCubit,
    );
    unknownPage = const UnknownPage();
    statisticsPage = const StatisticsPage();
    profilePage = const ProfilePage();
    allPages = [homePage, unknownPage, statisticsPage, profilePage];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainCubit, MainState>(
        bloc: mainCubit,
        builder: (context, state) {
          return allPages[state.selectedPageItem];
        },
      ),
      bottomNavigationBar: bottomNavMenu(),
    );
  }

  bottomNavMenu() {
    return BlocBuilder<MainCubit, MainState>(
      bloc: mainCubit,
      builder: (context, state) {
        return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: mainCubit.state.selectedPageItem,
            onTap: (value) {
              mainCubit.setPage(value);
            },
            items: [
              bottomBarItem(0, Icons.home_outlined),
              bottomBarItem(1, Icons.navigation),
              bottomBarItem(2, Icons.analytics_outlined),
              bottomBarItem(3, Icons.person),
            ]);
      },
    );
  }

  BottomNavigationBarItem bottomBarItem(int index, IconData icon) {
    return BottomNavigationBarItem(
      label: "",
      icon: mainCubit.state.selectedPageItem == index
          ? Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 7,
              children: [
                Icon(
                  icon,
                  color: Colors.blue.shade900,
                  size: 32,
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(24),
                  ),
                )
              ],
            )
          : Icon(
              icon,
              color: Colors.blueGrey,
              size: 28,
            ),
    );
  }
}
