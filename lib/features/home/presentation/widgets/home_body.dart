import 'package:flutter/material.dart';
import 'package:spotify_app/features/home/presentation/widgets/artist_card.dart';
import 'package:spotify_app/features/home/presentation/widgets/home_tap_bar.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        // Atrist Card
        const ArtistCard(),
        HomeTabBar(tabController: _tabController),
      ],
    );
  }
}

