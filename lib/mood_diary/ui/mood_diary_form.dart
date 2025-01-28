import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mood_diary/configuration/assets.dart';
import 'package:mood_diary/mood_diary/bloc/mood_diary_bloc.dart';

class MoodDiaryForm extends StatefulWidget {
  const MoodDiaryForm({super.key});

  @override
  State<MoodDiaryForm> createState() => _MoodDiaryFormState();
}

class _MoodDiaryFormState extends State<MoodDiaryForm>
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
      appBar: AppBar(
        title: Text(getTodayDate()),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.calendar))
        ],
      ),
      body: BlocBuilder<MoodDiaryBloc, MoodDiaryState>(
        builder: (context, state) {
          return Column(children: [
            TabBar(controller: tabController, tabs: [
              Tab(
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.calendar),
                    const SizedBox(width: 10),
                    const Text("Дневник настроения"),
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
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  ColoredBox(color: Colors.red),
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
