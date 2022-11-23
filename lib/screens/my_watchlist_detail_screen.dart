import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pbp_assignment_flutter/components/drawer_component.dart';
import 'package:pbp_assignment_flutter/models/watchlist_model.dart';
import 'package:pbp_assignment_flutter/service/watchlist_service.dart';

class MyWishlistDetailScreen extends StatefulWidget {
  const MyWishlistDetailScreen({super.key, required this.id});

  final int id;
  final String title = "My Watch List Detail";

  @override
  State<MyWishlistDetailScreen> createState() => _MyWishlistDetailScreenState();
}

class _MyWishlistDetailScreenState extends State<MyWishlistDetailScreen> {
  final DateFormat formatter = DateFormat('MMMd, yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: DrawerComponents(currentPage: widget.title),
      body: FutureBuilder(
        future: WatchListService.getWatchList(widget.id),
        builder: (BuildContext context, AsyncSnapshot<WatchList> snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            return Column(
              children: const [
                Text(
                  "Watch list data not found!",
                  style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                ),
                SizedBox(height: 8),
              ],
            );
          } else {
            return Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Center(
                            child: Text(
                          snapshot.data!.fields.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 4),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Release Date: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(formatter.format(
                                        snapshot.data!.fields.releaseDate))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 4),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Rating: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("${snapshot.data!.fields.rating}/5")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 4),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Status: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(snapshot.data!.fields.watched
                                        ? "watched"
                                        : "not watched")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Review: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(snapshot.data!.fields.review)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    TextButton(
                        style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(
                                const Size.fromHeight(50)),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35)))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "back",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ));
          }
        },
      ),
    );
  }
}
