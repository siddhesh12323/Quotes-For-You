import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    //     appBar: AppBar(
    //       leading: Padding(
    //         padding: const EdgeInsets.only(top: 14),
    //         child: IconButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             icon: const Icon(Icons.arrow_back, size: 34,)),
    //       ),
    //       backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    //       titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
    //     ),
    //     body: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.fromLTRB(14, 30, 0, 0),
    //           child: Text(
    //             'Favorites',
    //             style: Theme.of(context).textTheme.displayMedium,
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 14,
    //         ),
    //         Expanded(
    //           child: ListView.builder(
    //             itemBuilder: (context, index) {
    //               return ListTile(
    //                 title: Text('Quote #$index'),
    //                 subtitle: Text('Author #$index'),
    //                 trailing: IconButton(
    //                   icon: Icon(Icons.favorite_outline),
    //                   onPressed: () {},
    //                 ),
    //                 style: Theme.of(context).listTileTheme.style,
    //               );
    //             },
    //             itemCount: 5,
    //           ),
    //         ),
    //       ],
    //     ));
  //* UNCOMMENT FOR LATER
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // actions: [
            //   IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back))
            // ],
            //title: Text('Favorites'),
            automaticallyImplyLeading: false,
            expandedHeight: 150,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                  alignment: Alignment.bottomLeft,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              title: Text('Favorites',textAlign: TextAlign.left,),
            ),
            //titleTextStyle: Theme.of(context).textTheme.headlineSmall,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                                  return ListTile(
                    title: Text('Quote #$index'),
                    subtitle: Text('Author #$index'),
                    trailing: IconButton(
                      icon: Icon(Icons.favorite_outline),
                      onPressed: () {},
                    ),
                    style: Theme.of(context).listTileTheme.style,
                  );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }

  //try new
  // List<Widget> headerSliverBuilder(context, innerBoxIsScrolled) {
  //   return [SliverOverlapAbsorber(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
  //   sliver: SliverAppBar(
  //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  //     expandedHeight: 150,
  //     pinned: true,
  //     toolbarHeight: kToolbarHeight,
  //   ),)];
  // }

  // Widget body() {
  //   return Container();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return NestedScrollView(headerSliverBuilder: headerSliverBuilder, body: body);
  // }
}
