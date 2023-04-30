import 'package:flutter/material.dart';

class Customize extends StatefulWidget {
  Customize({super.key});

  @override
  State<Customize> createState() => _CustomizeState();
}

class _CustomizeState extends State<Customize> {
  List<String> dropdownitems = [
    'Swipe down',
    'Swipe up',
    'Swipe right',
    'Swipe left'
  ];
  List<String> fontList = [
    'Atrament',
    'Cedarville',
    'Comic Neue',
    'Dork Diary',
    'Fondamento',
    'Merriweather',
    'Montserrat',
    'NotoSans',
    'Patrick Hand',
    'PinyonScript',
    'Proxima Nova',
    'Raleway',
    'Source Sans Pro',
    'Space Mono'
  ];

  String selectedOption = 'Swipe left';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 34,
                )),
          ),
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
                    ListTile(
                      title: const Text('App Theme'),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.redAccent),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Choose Color'),
                                  content: Container(
                                    width: double.maxFinite,
                                    height: 300,
                                    child: Material3ColorPicker(
                                      onColorChanged: (Color color) {
                                        // Do something with the selected color
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      style: Theme.of(context).listTileTheme.style,
                    ),
                    //* App Font
                    ListTile(
                      title: const Text('App Font'),
                      trailing: TextButton(
                        child: Text('Current App Font'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Choose App Font"),
                                  content: Container(
                                      width: double.maxFinite,
                                      height: 400,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(
                                              fontList[index],
                                              style: TextStyle(
                                                  fontFamily: fontList[index]),
                                            ),
                                            style: Theme.of(context)
                                                .listTileTheme
                                                .style,
                                            onTap: () {
                                              // Set the font
                                            },
                                          );
                                        },
                                        itemCount: fontList.length,
                                      )),
                                  backgroundColor:
                                      Theme.of(context).dialogBackgroundColor,
                                );
                              });
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
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Choose Quote Font"),
                                  content: Container(
                                      width: double.maxFinite,
                                      height: 400,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            title: Text(
                                              fontList[index],
                                              style: TextStyle(
                                                  fontFamily: fontList[index]),
                                            ),
                                            style: Theme.of(context)
                                                .listTileTheme
                                                .style,
                                            onTap: () {
                                              // Set the font
                                            },
                                          );
                                        },
                                        itemCount: fontList.length,
                                      )),
                                  backgroundColor:
                                      Theme.of(context).dialogBackgroundColor,
                                );
                              });
                        },
                        style: Theme.of(context).textButtonTheme.style,
                      ),
                      style: Theme.of(context).listTileTheme.style,
                    ),
                    //Gesture to favorites
                    ListTile(
                      title: const Text('Gesture to Favorites'),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: DropdownButton(
                          value: selectedOption,
                          items: dropdownitems.map((String option) {
                            return DropdownMenuItem(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            // setState(() {
                            //   selectedOption = newValue.toString();
                            // });
                          },
                          style: Theme.of(context).dropdownMenuTheme.textStyle,
                        ),
                      ),
                      style: Theme.of(context).listTileTheme.style,
                    ),
                  ],
                ),
              )
            ]));
  }
}

class Material3ColorPicker extends StatefulWidget {
  final ValueChanged<Color>? onColorChanged;

  const Material3ColorPicker({Key? key, this.onColorChanged}) : super(key: key);

  @override
  _Material3ColorPickerState createState() => _Material3ColorPickerState();
}

class _Material3ColorPickerState extends State<Material3ColorPicker> {
  final List<Color> _colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.grey,
    Colors.brown,
    Colors.cyan,
    Colors.amber,
    Colors.teal,
    Colors.pink
  ];

  Color _selectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 4,
        children: List.generate(
          _colors.length,
          (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = _colors[index];
                });
                if (widget.onColorChanged != null) {
                  widget.onColorChanged!(_selectedColor);
                }
              },
              child: Container(
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: _colors[index],
                  shape: BoxShape.circle,
                ),
                child: _colors[index] == _selectedColor
                    ? Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      )
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}
