import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

const tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text('Discover'),
          bottom: TabBar(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size6,
              ),
              splashFactory: NoSplash.splashFactory,
              isScrollable: true,
              unselectedLabelColor: Colors.grey.shade500,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
              ),
              tabs: [
                for (var tab in tabs)
                  Tab(
                    text: tab,
                  ),
              ]),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              itemCount: 20,
              padding: const EdgeInsets.all(
                Sizes.size5,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 5 / 8,
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.amber,
                  child: Center(
                    child: Text(
                      '$index',
                    ),
                  ),
                );
              },
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: Sizes.size28,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
