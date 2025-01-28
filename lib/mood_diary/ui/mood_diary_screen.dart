import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary/configuration/assets.dart';
import 'package:mood_diary/mood_diary/bloc/mood_diary_bloc.dart';
import 'package:mood_diary/mood_diary/ui/forms/mood_diary_form.dart';

class MoodDiaryScreen extends StatefulWidget {
  const MoodDiaryScreen({super.key});

  @override
  State<MoodDiaryScreen> createState() => _MoodDiaryScreenState();
}

class _MoodDiaryScreenState extends State<MoodDiaryScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  String getTodayDate() {
    return DateFormat(
      'd MMMM HH:mm',
    ).format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 253, 252, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 253, 252, 1),
        title: Text(getTodayDate()),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.calendar))
        ],
      ),
      body: BlocBuilder<MoodDiaryBloc, MoodDiaryState>(
        builder: (context, state) {
          return Column(spacing: 8, children: [
            TabBar(
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    border: Border.all(width: 0.0001),
                    borderRadius: BorderRadius.circular(50),
                    color: const Color.fromRGBO(255, 135, 2, 1)),
                tabAlignment: TabAlignment.center,
                controller: tabController,
                automaticIndicatorColorAdjustment: false,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        SvgPicture.asset(Assets.calendar),
                        Text(
                          "Дневник настроения",
                          style: TextStyle(
                              color: tabController.index == 0
                                  ? Colors.white
                                  : Colors.black12),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        SvgPicture.asset(Assets.static),
                        Text("Статистика",
                            style: TextStyle(
                                color: tabController.index == 1
                                    ? Colors.white
                                    : Colors.black12)),
                      ],
                    ),
                  ),
                ]),
            Flexible(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const MoodDiaryForm(),
                  ),
                  const ColoredBox(color: Colors.yellow),
                ],
              ),
            ),
          ]);
        },
      ),
    );
  }
}
