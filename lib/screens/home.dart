import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_app/model/get_quote.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<QuoteModel> quoteList = [];
    Future<List<QuoteModel>> getRandomQuote() async {
      final response = await http
          .get(Uri.parse('https://zenquotes.io/api/random/[your_key]'));
      // final bytes = response.bodyBytes;
      // final temp = await getTemporaryDirectory();
      // final path = '$'
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        for (Map<String, dynamic> i in data) {
          quoteList.add(QuoteModel.fromJson(i));
        }
        return quoteList;
      } else {
        return quoteList;
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Quotes For You',),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      body: FutureBuilder(
        future: getRandomQuote(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                ),
                Text(
                  'Loading...',
                  style: Theme.of(context).textTheme.displaySmall,
                )
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          snapshot.data![0].q.toString(),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 14),
                        Text(
                          ' by ${snapshot.data![0].a}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      getRandomQuote();
                    });
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: const Text('Get Quote'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await Share.share(
                        'Check out this Quote:\n${snapshot.data![0].q.toString()}\nby ${snapshot.data![0].a}');
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: const Text('Share'),
                ),
              ],
            );
          }
        },
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          //try writing outside setState()
          //setState(() {
            currentIndex = index;
          //});
          switch (currentIndex) {
            case 1:
              Navigator.pushNamed(context, '/favorites');
              break;
            case 2:
              Navigator.pushNamed(context, '/customize');
              break;
            case 3:
              Navigator.pushNamed(context, '/about');
              break;
            default:
          }
        },
        selectedIndex: currentIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.favorite), label: 'Favorites'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
          NavigationDestination(icon: Icon(Icons.info), label: 'About')
        ],
      ),
    );
  }
}
