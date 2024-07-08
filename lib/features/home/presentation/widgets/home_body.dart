import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/features/home/presentation/widgets/artist_card.dart';
import 'package:spotify_app/features/home/presentation/widgets/home_tap_bar.dart';
import 'package:spotify_app/features/home/presentation/widgets/news_songs.dart';

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
    return Column(
      children: [
        // Atrist Card
        const ArtistCard(),
        HomeTabBar(tabController: _tabController),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
            const NewsSongs(),
            Container(),
            Container(),
            Container(),
          ]),
        ),
        // News Songs,
      ],
    );
  }
}
