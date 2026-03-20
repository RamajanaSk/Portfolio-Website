import 'package:flutter/material.dart';

class CustomeDrawerMenu extends StatefulWidget {
  final bool isVisible;

  CustomeDrawerMenu({Key? key, required this.isVisible}) : super(key: key);

  @override
  _CustomeDrawerMenuState createState() => _CustomeDrawerMenuState();
}

class _CustomeDrawerMenuState extends State<CustomeDrawerMenu> {
  Color boxColor = Colors.blue; // Default color of the box
  int _expandedIndex = -1; // Track expanded tile
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isVisible) {
        _scaffoldKey.currentState?.openDrawer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
        ),
        backgroundColor: const Color.fromARGB(255, 34, 34, 34),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildCategory(0, 'GAMES', Colors.red, [
                    'Flutter',
                    'Kotlin',
                    'Unity 2D',
                    'Unity 3D',
                    'Unity VR'
                  ]),
                  _buildCategory(2, 'ART & DESIGN', Colors.cyan, [
                    'Adobe Illustrator',
                    'Adobe Photoshop',
                    'Blender',
                    'Figma',
                    'Krita'
                  ]),
                  _buildCategory(3, 'WRITINGS', Colors.green,
                      ['Poetry', 'Short Stories', 'Novels']),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.35,
              color: boxColor, // Colored box in the drawer
            ),
          ],
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 34, 34, 34),
        alignment: Alignment.center,
        child: Text(
          'Select a category from the drawer',
          style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255), fontSize: 24),
        ),
      ),
    );
  }

  Widget _buildCategory(
      int index, String title, Color hoverColor, List<String> subCategories) {
    bool isExpanded = _expandedIndex == index;
    return ExpansionPanelList(
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          _expandedIndex =
              _expandedIndex == index ? -1 : index; // Toggle the expanded item
          boxColor = isExpanded
              ? hoverColor
              : Colors.blue; // Change box color on expand
        });
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true, // Make the entire header clickable
          backgroundColor: const Color.fromARGB(255, 34, 34, 34),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 16, vertical: 8), // Reduced padding
              title: Text(
                title,
                style: TextStyle(
                  color: isExpanded
                      ? const Color.fromARGB(255, 255, 255, 255)
                      : Colors.white, // Red color for expanded, white otherwise
                  fontWeight: isExpanded
                      ? FontWeight.bold
                      : FontWeight.bold, // Bold for expanded
                ),
              ),
            );
          },
          body: Column(
            children: subCategories
                .map((subCategory) => ListTile(
                      title: Text(
                        subCategory,
                        style: TextStyle(
                            color: const Color.fromARGB(179, 241, 241,
                                241)), // Set text color to light white for subcategories
                      ),
                      onTap: () {
                        print('$subCategory clicked');
                      },
                    ))
                .toList(),
          ),
          isExpanded: isExpanded,
        ),
      ],
    );
  }
}
