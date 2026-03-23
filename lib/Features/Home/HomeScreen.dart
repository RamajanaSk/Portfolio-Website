import 'package:flutter/material.dart';
import 'package:ramajana05/Core/theme/animated_background.dart';
import 'package:ramajana05/Core/widgets/Footer.dart';
import 'package:ramajana05/Features/Projects/ProjectListScreen.dart';
import 'package:ramajana05/Sections/SkillsSection.dart';
import 'package:ramajana05/Core/widgets/TopBar.dart'; // Ensure this import path is correct
import 'package:ramajana05/Sections/SkillsSection.dart';
import 'package:ramajana05/Widgets/LandingWidget.dart';
import '../../Widgets/StartScreenWidget.dart';
import '../../Widgets/GetToKnowMeWidget.dart';
import '../../Core/theme/app_colors.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key, required this.title});

  final String title;

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final GlobalKey _aboutMeKey = GlobalKey();
  final GlobalKey _titleKey = GlobalKey();
  final GlobalKey _footerKey = GlobalKey();

  // Create a list of skills
  final List<Skill> mySkills = [
    Skill(
      icon: Icons.code,
      title: "Web Development",
      description: "Experienced in modern web technologies.",
      iconColor: Colors.lightBlue,
    ),
    Skill(
      icon: Icons.security,
      title: "Cyber Security",
      description: "Deep understanding of secure coding practices.",
      iconColor: Colors.redAccent,
    ),
    Skill(
      icon: Icons.phone_android,
      title: "Mobile Apps",
      description: "Building smooth and responsive mobile applications.",
      iconColor: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AnimatedGradientBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height,
                child: const Landingwidget(), // <<-- here it goes
              ),
              //StartScreenWidget
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height,
                child: const StartScreenWidget(), // <<-- here it goes
              ),
              //GetToKnowMeWidget
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height,
                child: const GetToKnowMeWidget(), // <<-- here it goes
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      key: _titleKey,
                      padding: const EdgeInsets.all(20.0),
                      color: Color.fromARGB(255, 250, 0, 0),
                      width: double.infinity,
                      child: Text(
                        "I'm Ramajana, Creative Developer",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "asda dadada da dafasdfgs sagasgag asdfasg g g gfga gfdagfg adfghfg aer gawrga sfg ag gsg asdgsftgsg s g sg gsf fgsgs gs sg sg sdfsdafs fgagfd ga.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 20),
                      ),
                    ),
                    _buildButtons(),
                  ],
                ),
              ),
              Container(
                key: _aboutMeKey,
                color: Colors.white,
                child: Column(
                  children: [
                    SkillsSection(
                        skills: mySkills), // Adding the SkillsSection here
                  ],
                ),
              ),

              Container(
                key: _footerKey,
                color: Colors.white,
                child: Column(
                  children: [
                    Footer(),
                    // Adding the SkillsSection here
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("Download CV"),
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.purple),
          ),
          SizedBox(width: 20),
          OutlinedButton(
            onPressed: () {},
            child: Text("View Portfolio ->"),
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.purple,
                side: BorderSide(color: Colors.purple)),
          ),
        ],
      ),
    );
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    }
  }
}
