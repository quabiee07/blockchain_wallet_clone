import 'package:blockchain/color.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;
  final List<String> text;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      required this.iconList,
      required this.text,
      required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];
  List<String> _text = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
    _text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length && i < _text.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], _text[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, String text, int index) {
    return GestureDetector(
        onTap: () {
          widget.onChange(index);
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          height: 60,

          width: MediaQuery.of(context).size.width / _iconList.length,
          decoration: index == _selectedIndex
              ?  const BoxDecoration(
                  border:  Border(
                    top: BorderSide(width: 2, color: secondaryColor),
                  ),
                  // gradient: LinearGradient(colors: [
                  //   Colors.green.withOpacity(0.3),
                  //   Colors.green.withOpacity(0.015),
                  // ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                  )
              : const BoxDecoration(),
          child: Column(children: [
            Icon(icon,
                color: index == _selectedIndex
                    ? secondaryColor
                    : Colors.grey[400]),
            Text(
              text,
              style: TextStyle(
                  fontSize: 10,
                  color: index == _selectedIndex
                      ? secondaryColor
                      : Colors.grey[400]),
            )
          ]),
        ));
  }
}
