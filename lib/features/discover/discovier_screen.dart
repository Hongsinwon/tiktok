import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
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

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController = TextEditingController(
    text: 'initial text',
  );

  void _onSearchChanged(String value) {
    print('search $value');
  }

  void _onSearchSubmitted(String value) {
    print('submitted $value');
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          title: CupertinoSearchTextField(
            controller: _textEditingController,
            onChanged: _onSearchChanged,
            onSubmitted: _onSearchSubmitted,
          ),
          bottom: TabBar(
              onTap: (value) {
                FocusScope.of(context).unfocus();
              },
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
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(
                Sizes.size5,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 5 / 10.1,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Sizes.size4,
                        ),
                      ),
                      child: AspectRatio(
                        aspectRatio: 5 / 8,
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/placeholder.jpg',
                          image:
                              'https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Gaps.v10,
                    const Text(
                      'This is a very long caption for my tiktok taht im uploading just now currently.',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Gaps.v5,
                    DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: Sizes.size12,
                            child: Text('baek'),
                          ),
                          Gaps.h4,
                          const Expanded(
                            child: Text(
                              'My avatar is going to be very long',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Gaps.h4,
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size16,
                            color: Colors.grey.shade500,
                          ),
                          Gaps.h2,
                          const Text(
                            '2.5M',
                          ),
                        ],
                      ),
                    ),
                  ],
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