import 'package:flutter/material.dart';

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
  ];

  Color _selectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
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
    );
  }
}
