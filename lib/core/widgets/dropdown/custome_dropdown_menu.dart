import 'package:flutter/material.dart';

class CustomeDropdownMenu extends StatefulWidget {
  final bool isVisible;

  CustomeDropdownMenu({Key? key, required this.isVisible}) : super(key: key);

  @override
  _CustomeDropdownMenuState createState() => _CustomeDropdownMenuState();
}

class _CustomeDropdownMenuState extends State<CustomeDropdownMenu> {
  Color boxColor = Colors.blue; // Default color of the right box

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: Row(
        children: <Widget>[
          Expanded(
            child: CategoryMenu(
              onHover: (Color color) {
                setState(() {
                  boxColor = color;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 34, 34, 34),
                boxShadow: [],
              ),
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.30,
              child: Container(
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryMenu extends StatelessWidget {
  final Function(Color) onHover;

  CategoryMenu({Key? key, required this.onHover}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        'title': 'GAMES',
        'color': Colors.red,
        'subCategories': [
          'Flutter',
          'Kotlin',
          'Unity 2D',
          'Unity 3D',
          'Unity VR'
        ]
      },
      {
        'title': 'ART & DESIGN',
        'color': Colors.cyan,
        'subCategories': [
          'Adobe Illustrator',
          'Adobe Photoshop',
          'Blender',
          'Figma',
          'Krita'
        ]
      },
      {
        'title': 'WRITINGS',
        'color': Colors.green,
        'subCategories': ['Poetry', 'Short Stories']
      },
    ];

    return Container(
      color: const Color.fromARGB(255, 34, 34, 34),
      height: MediaQuery.of(context).size.height * 0.30,
      child: GridView.custom(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) {
            return _buildCategory(categories[index]['title'],
                categories[index]['color'], categories[index]['subCategories']);
          },
          childCount: categories.length,
          findChildIndexCallback: (Key key) {
            final ValueKey valueKey = key as ValueKey;
            final String name = valueKey.value;
            return categories.indexWhere((element) => element['title'] == name);
          },
        ),
      ),
    );
  }

  Widget _buildCategory(
      String title, Color hoverColor, List<String> subCategories) {
    return Container(
      key: ValueKey(title),
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MouseRegion(
            onEnter: (_) => onHover(hoverColor),
            onExit: (_) => onHover(Colors.blue),
            child: Container(
              padding: EdgeInsets.all(8),
              color: const Color.fromARGB(255, 31, 31, 31),
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          Column(
            children: subCategories
                .map((subCategory) => InkWell(
                      onTap: () {
                        // Add your action here, e.g., navigation or dialog
                        print('$subCategory clicked');
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        alignment: Alignment.centerLeft,
                        child: Text(subCategory,
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
