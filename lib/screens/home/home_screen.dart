import 'package:flutter/material.dart';
import 'package:custom_firebase_whatsapp/constants/constants.dart';

/// Models:

/// Screens:

/// Widgets:
import 'package:custom_firebase_whatsapp/screens/home/widgets/camera_tab.dart';
import 'package:custom_firebase_whatsapp/screens/home/widgets/chat_tab.dart';
import 'package:custom_firebase_whatsapp/screens/home/widgets/groups_tab.dart';
import 'package:custom_firebase_whatsapp/screens/home/widgets/status_tab.dart';
import 'package:custom_firebase_whatsapp/screens/home/speed_dial.dart';
import 'package:custom_firebase_whatsapp/screens/home/widgets/call_tab.dart';
import 'package:flutter/services.dart';

/// Services:

/// State:
import 'package:provider/provider.dart';
import '../../state/theme_state.dart';

/// Utils/Helpers:
import 'package:responsive_builder/responsive_builder.dart';

/// Entry Point:
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin<HomeScreen> {
  @override
  bool get wantKeepAlive => true;

  late TabController _controller;
  final initialIndex = 1;
  final tabsCount = 5;

  var isDialOpen = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: tabsCount, initialIndex: initialIndex, vsync: this);
    // _controller.animateTo(1);
    _controller.addListener(handleTabIndex);
  }

  @override
  void dispose() {
    _controller.removeListener(handleTabIndex);
    _controller.dispose();

    super.dispose();
  }

  void handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(kAppBarColor),
      ),
    );
    // Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) {
            return OrientationLayoutBuilder(
              // Force a screen to stay in portrait/landscape. Overrides the OrientationLayoutBuilder
              // mode: OrientationLayoutBuilderMode.portrait,
              portrait: (context) => NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      actionsIconTheme: const IconThemeData(
                        color: Color(kAppBarIconsOrLabelColor),
                      ),
                      backgroundColor: const Color(kAppBarColor),
                      title: const Text(
                        'WhatsApp',
                        style: TextStyle(color: Color(kAppBarIconsOrLabelColor)),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Provider.of<ThemeStateProvider>(context, listen: false).toggleTheme();
                            },
                            child: Provider.of<ThemeStateProvider>(context).darkTheme
                                ? const Icon(Icons.dark_mode)
                                : const Icon(Icons.light_mode),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.search),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 14),
                          child: GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.more_vert),
                          ),
                        ),
                      ],
                      pinned: true,
                      floating: true,
                      snap: false,
                      forceElevated: innerBoxIsScrolled,
                      bottom: TabBar(
                        controller: _controller,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelPadding: const EdgeInsets.symmetric(horizontal: 14),
                        labelColor: const Color(kAppBarIndicatorColor),
                        unselectedLabelColor: const Color(kAppBarIconsOrLabelColor),
                        indicatorColor: const Color(kAppBarIndicatorColor),
                        onTap: (int index) {},
                        tabs: [
                          Container(
                            alignment: Alignment.center,
                            child: const Tab(
                              icon: Icon(Icons.camera_alt),
                            ),
                          ),
                          Tab(text: "CHATS"),
                          Tab(text: "GROUPS"),
                          Tab(text: "STATUS"),
                          Tab(text: "CALLS"),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  controller: _controller,
                  children: [
                    CameraTab(controller: _controller),
                    ChatTab(
                      imageUrl: 'https://picsum.photos/id/237/200/300',
                      itemCount: 5,
                    ),
                    GroupTab(
                      imageUrl: 'https://picsum.photos/id/237/200/300',
                      itemCount: 5,
                    ),
                    StatusTab(
                      userProfileImage: 'https://picsum.photos/id/237/200/300',
                      itemCount: 5,
                    ),
                    CallTab(
                      userProfileImage: 'https://picsum.photos/id/237/200/300',
                      itemCount: 5,
                    ),
                  ],
                ),
              ),
              landscape: (context) => Container(),
            );
          },
          tablet: (BuildContext context) {
            return OrientationLayoutBuilder(
              portrait: (context) => Container(),
              landscape: (context) => Container(),
            );
          },
          desktop: (BuildContext context) => Container(),
        ),
      ),
      floatingActionButton: SpeedDialWidget(
        isDialOpen: isDialOpen,
        controller: _controller,
      ),
    );
  }
}
