import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:herogames_ui2/widgets/first_card.dart';
import 'package:herogames_ui2/widgets/second_card.dart';

import '../cubit/main_cubit.dart';

class HomePage extends StatefulWidget {
  final MainCubit mainCubit;

  const HomePage({super.key, required this.mainCubit});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    height: ScreenUtil().orientation == Orientation.portrait
                        ? height * 0.45
                        : height * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.04,
                        ),
                        FirstCard(
                          mainCubit: widget.mainCubit,
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        const SecondCard(),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            "Workout Programs",
                            style: GoogleFonts.roboto(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        TabBar(
                            unselectedLabelColor: Colors.grey,
                            labelColor: Colors.indigo,
                            indicatorColor: Colors.indigo,
                            controller: tabController,
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: [
                              Tab(
                                child: Text(
                                  'All Type',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Full Body',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Upper',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Lower',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ]),
                      ],
                    )),
                tabBarView(height, width)
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox tabBarView(double height, double width) {
    return SizedBox(
      height: ScreenUtil().orientation == Orientation.portrait
          ? height * 0.5
          : height * 2.5,
      width: double.infinity,
      child: TabBarView(
        controller: tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                item(
                    width,
                    height,
                    "7 days",
                    "Morning Yoga",
                    "Improve mental focus.",
                    "30 mins",
                    "assets/images/morning_yoga.png"),
                SizedBox(
                  height: height * 0.075,
                ),
                item(
                    width,
                    height,
                    "3 days",
                    "Plank Exercise",
                    "Improve posture and stability.",
                    "30 mins",
                    "assets/images/plank_exercise.png"),
              ],
            ),
          ),
          const Center(child: Text("This page still under development")),
          const Center(child: Text("This page still under development")),
          const Center(child: Text("This page still under development")),
        ],
      ),
    );
  }

  Column item(double width, double height, String day, String title,
      String subTitle, String time, String imgPath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          day,
          style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Row(
          children: [
            Wrap(
              spacing: 7,
              direction: Axis.vertical,
              children: [
                Text(
                  title,
                  style: GoogleFonts.roboto(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  subTitle,
                  style: GoogleFonts.roboto(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: [
                    const Icon(Icons.access_time_rounded),
                    Text(
                      time,
                      style: GoogleFonts.roboto(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              width: width * 0.05,
            ),
            Expanded(
              child: Image.asset(imgPath),
            )
          ],
        )
      ],
    );
  }
}
