import 'package:flutter/material.dart';

/// Models:

/// Screens:

/// Widgets:

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
    // Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ResponsiveHelper(
          mobile: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: const Text('Tabs Demo'),
                  pinned: true,
                  floating: true,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    controller: _controller,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 14),
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
                SizedBox.expand(
                  child: GestureDetector(
                    onTap: () {
                      _controller.animateTo(1);
                    },
                    child: Icon(Icons.directions_car, size: 350,),
                  ),
                ),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
                Icon(Icons.directions_car),
                Icon(Icons.directions_transit),
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
