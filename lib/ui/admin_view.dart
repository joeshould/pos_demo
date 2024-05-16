import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poslink2/model/base_view_model.dart';
import 'package:poslink2/res/colors.dart';

import '../widget/base_widget.dart';

class AdminView extends StatefulWidget {
  const AdminView({Key? key}) : super(key: key);

  @override
  AdminViewState createState() => AdminViewState();
}

class AdminViewState extends State<AdminView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      //Log.v(_tabController.index);
    });
    _tabController.index = 0;
    super.initState();
  }

  updateTab(int index) {
    setState(() {
      _tabController.index = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kMainColor,
          toolbarHeight: 0,
          elevation: 0,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Request'),
              Tab(text: 'Response'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            BaseView(
              command: Command.ADMIN,
              type: 1,
            ),
            BaseView(
              command: Command.ADMIN,
              type: 2,
            ),
          ],
        ),
      ),
    );
  }
}
