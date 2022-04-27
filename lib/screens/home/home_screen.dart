import 'package:flutter/material.dart';

/// Models:

/// Screens:

/// Widgets:
import 'package:custom_firebase_whatsapp/screens/home/widgets/camera_tab.dart';
import 'package:custom_firebase_whatsapp/screens/home/widgets/call_tab.dart';
import 'package:custom_firebase_whatsapp/screens/home/widgets/chat_tab.dart';
import 'package:custom_firebase_whatsapp/screens/home/widgets/groups_tab.dart';
import 'package:custom_firebase_whatsapp/screens/home/widgets/status_tab.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../state/theme_state.dart';

/// Services:

/// State:

/// Utils/Helpers:
import '../../utils/responsive_helper.dart';

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
  bool indexIsNotOne = true;

  @override
  void initState() {
    _controller = TabController(length: 5, vsync: this);
    _controller.animateTo(1);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF354c5a),
      ),
    );
    // Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ResponsiveHelper(
          mobile: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: const Color(0xFF354c5a),
                  title: const Text('WhatsApp'),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<ThemeStateProvider>(context, listen: false).toggleTheme();
                        },
                        child: Provider.of<ThemeStateProvider>(context).darkTheme
                            ? Icon(Icons.dark_mode)
                            : Icon(Icons.light_mode),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.search),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.more_vert),
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
                    labelColor: Color(0xFF178b74),
                    unselectedLabelColor: Color(0xFF85969e),
                    indicatorColor: Color(0xFF178b74),
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
                ChatTab(),
                GroupTab(),
                StatusTab(),
                CallTab(),
              ],
            ),
          ),
          tablet: Container(),
          desktop: Container(),
        ),
      ),
    );
  }
}
