import 'package:flutter/material.dart';

class Customize extends StatefulWidget {
  Customize({super.key});

  @override
  State<Customize> createState() => _CustomizeState();
}

class _CustomizeState extends State<Customize> {
  List<String> dropdownitems = ['Swipe down', 'Swipe up', 'Swipe right', 'Swipe left'];

  String selectedOption = 'Swipe left';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 30, 0, 0),
                child: Text(
                  'Customize',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    //* App theme
                    // ListTile(
                    //   title: const Text('App Theme'),
                    //   trailing: Container(
                    //     child: GestureDetector(
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10),
                    //             color: Colors.redAccent),
                    //       ),
                    //       onTap: () {
                    //         // open color picker
                    //       },
                    //     ),
                    //   ),
                    //   style: Theme.of(context).listTileTheme.style,
                    // ),
                    //* App Font
                    ListTile(
                      title: const Text('App Font'),
                      trailing: TextButton(
                        child: Text('Current App Font'),
                        onPressed: () {
                          //Open dialog
                        },
                        style: Theme.of(context).textButtonTheme.style,
                      ),
                      style: Theme.of(context).listTileTheme.style,
                    ),
                    //Quote Font
                    ListTile(
                      title: const Text('Quote Font'),
                      trailing: TextButton(
                        child: Text('Current Quote Font'),
                        onPressed: () {
                          //Open dialog
                        },
                        style: Theme.of(context).textButtonTheme.style,
                      ),
                      style: Theme.of(context).listTileTheme.style,
                    ),
                    //Gesture to favorites
                    ListTile(
                      title: const Text('Gesture to Favorites'),
                      // trailing: DropdownButton(
                      //   value: selectedOption,
                      //   items: dropdownitems.map((String option) {
                      //     return DropdownMenuItem(
                      //       value: option,
                      //       child: Text(option),
                      //     );
                      //   }).toList(),
                      //   onChanged: (newValue) {
                      //     // setState(() {
                      //     //   selectedOption = newValue.toString();
                      //     // });
                      //   },
                      //   style: Theme.of(context).dropdownMenuTheme.textStyle,
                      // ),
                      style: Theme.of(context).listTileTheme.style,
                    ),
                  ],
                ),
              )
            ]));
  }
}
