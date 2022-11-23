import 'package:flutter/material.dart';
import 'package:pbp_assignment_flutter/components/drawer_component.dart';
import 'package:pbp_assignment_flutter/screens/my_watchlist_detail.dart';
import 'package:pbp_assignment_flutter/service/watchlist_service.dart';

import '../models/watchlist_model.dart';

class MyWatchListScreen extends StatefulWidget {
  const MyWatchListScreen({super.key});

  final String title = "My Watch List";

  @override
  State<MyWatchListScreen> createState() => _MyWatchListScreenState();
}

class _MyWatchListScreenState extends State<MyWatchListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: DrawerComponents(currentPage: widget.title),
      body: FutureBuilder(
        future: WatchListService.getAllWatchList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<WatchList>> snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Watch list is empty :(",
                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyWishlistDetail(
                                      id: snapshot.data![index].pk)));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: const [
                                BoxShadow(color: Colors.black, blurRadius: 2.0)
                              ]),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Checkbox(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  onChanged: (bool? value) {
                                    WatchListService.updateWatchList(
                                        snapshot.data![index].pk);
                                    setState(() {});
                                  },
                                  value: snapshot.data![index].fields.watched,
                                ),
                              ),
                              Expanded(
                                flex: 8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].fields.title,
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
            }
          }
        },
      ),
    );
  }
}
