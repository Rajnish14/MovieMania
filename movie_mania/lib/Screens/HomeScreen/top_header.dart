import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class TopHeader extends StatefulWidget {
  final Function? callback;
  final Function? getAllCallback;
  const TopHeader({Key? key, this.callback, this.getAllCallback}) : super(key: key);

  @override
  State<TopHeader> createState() => _TopHeaderState();
}

class _TopHeaderState extends State<TopHeader> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var searchText = searchController.text;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {
            widget.getAllCallback!();
          }, icon: Icon(Icons.home, color: Colors.grey, size: 34,)),
          AnimSearchBar(
              width: 325,
              helpText: "Search a movie",
              textController: searchController,
              onSuffixTap: () {
                setState(() {
                  searchController.clear();
                });
              },
              onSubmitted: (searchText) {
                widget.callback!(searchText);
              })
        ],
      ),
    );
  }
}
