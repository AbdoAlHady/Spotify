import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/helpers/spacing.dart';
import 'package:spotify_app/features/home/presentation/widgets/artist_card.dart';
import 'package:spotify_app/features/home/presentation/widgets/home_tap_bar.dart';
import 'package:spotify_app/features/home/presentation/widgets/news_songs.dart';
import 'package:spotify_app/features/home/presentation/widgets/play_list/play_list_title.dart';
import 'package:spotify_app/features/home/presentation/widgets/play_list/play_lits.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Atrist Card
          const ArtistCard(),
          HomeTabBar(tabController: _tabController),
          SizedBox(
            height: 250.h,
            child: TabBarView(controller: _tabController, children: [
              const NewsSongs(),
              Container(),
              Container(),
              Container(),
            ]),
          ),
          verticalSpace(20),
      
          // Play List
          const PlayListTitle(),
          verticalSpace(25),
          const PlayList()
        ],
      ),
    );
  }
}

