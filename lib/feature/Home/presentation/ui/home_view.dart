import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child:Column(
              children: [
                Row(children: [
                  
                ],)
              ],
            ))
        ],
      ),
    );
  }
}
