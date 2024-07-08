import 'package:flutter/material.dart';
import 'package:spotify_app/features/home/presentation/widgets/artist_card.dart';


class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Atrist Card 
        ArtistCard(),
      ],
    );
  }
}


