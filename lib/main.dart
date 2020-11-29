import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
    );
  }
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);
  ScrollController _scrollController;

  List<String> items = ['1','2','3','4','5','6'];

  void _onRefresh() async {

    await Future.delayed(Duration(milliseconds: 1500));
    items.add((items.length + 1).toString());

    if(mounted){
      setState(() {

      });
    }
    _refreshController.refreshCompleted();

  }

  void _onLoading() async {

    await Future.delayed(Duration(milliseconds: 1000));

    _refreshController.loadComplete();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pull to refresh demo'),
      ),
      body: SafeArea(
          child: SmartRefresher(
              controller: _refreshController,
            onLoading: _onLoading,
            onRefresh: _onRefresh,
            enablePullDown: true,
            enablePullUp: true,
            footer: ClassicFooter(),
            header: WaterDropMaterialHeader(
              backgroundColor: Colors.white,
              color: Colors.red,
            ),
            child: ListView.builder(
              itemCount: items.length,
                controller: _scrollController,
                itemExtent: 100.0,
                itemBuilder: (c, index){
                  return Card(
                    color: Colors.black,
                    child: Center(
                      child: Text(items[index],style: TextStyle(fontSize: 25,color: Colors.white),),
                    ),
                  );
                }
            ),
          ),
      ),
    );
  }
}













