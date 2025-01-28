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
      backgroundColor: Color.fromRGBO(255, 253, 252, 1),
      appBar: AppBar(
        title: Text(getTodayDate()),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.calendar))
        ],
      ),
      body: BlocBuilder<MoodDiaryBloc, MoodDiaryState>(
        builder: (context, state) {
          return Column(spacing: 8, children: [
            TabBar(controller: tabController, tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.calendar),
                    const SizedBox(width: 10),
                    const Text("Дневник "),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.static),
                    const SizedBox(width: 10),
                    const Text("Статистика"),
                  ],
                ),
              ),
            ]),
            Flexible(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: const [
                  MoodDiaryForm(),
                  ColoredBox(color: Colors.yellow),
                ],
              ),
            ),
          ]);
        },
      ),
    );
  }
}
