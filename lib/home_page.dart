import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/education_page.dart';
import 'package:portfolio/project_page.dart';
import 'package:portfolio/skillset_page.dart';
import 'package:portfolio/work_page.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {

  Future<void> _launchURLApp(String url) async {
    if (!await launchUrl(Uri.parse(url),
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      await canLaunchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }


  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber
    );
    await launchUrl(launchUri);
  }

  void launchEmailSubmission() async {
    final Uri params = Uri(
        scheme: 'mailto',
        path: 'damanygt@gmail.com',
        query: 'subject=I want to hire you&body=Hi Victor'
    );

    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }

  }

  @override
  Widget build(BuildContext context) {
    var twitterLink = 'https://twitter.com/viktohblake';
    var telegramLink = 'https://t.me/blaqvirus';
    var instagramLink = 'https://instagram.com/viktohblake';
    var githubLink = 'https://github.com/Viktohblake';

    return Scaffold(
      body: AdaptiveTheme(
        builder: (ThemeData light, ThemeData dark) {
          return Container(
            padding: const EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.1,
                    0.5,
                    0.8,
                    0.7
                  ],
                  colors: [
                    Colors.grey[50]!,
                    Colors.grey[100]!,
                    Colors.grey[200]!,
                    Colors.grey[300]!
                  ],
                )
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 80.0,
                    backgroundImage: AssetImage('images/pic.jpeg'),
                  ),
                  const Text(
                    'Victor Onoja',
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pacifico'
                    ),
                  ),
                  Text(
                    'MOBILE APP DEVELOPER',
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.teal.shade600,
                        fontFamily: 'SourceSansPro',
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 150.0,
                    child: Divider(
                      color: Colors.grey.shade500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "An Enthusiastic Developer motivated and eagar to contribute to team "
                          "success through hard work, attention to detail and "
                          "excellent organizational skills with clear understanding "
                          "of task and training.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontFamily: 'SourceSansPro',
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 150.0,
                    child: Divider(
                      color: Colors.grey.shade500,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _makePhoneCall('+2348142469300');
                    },
                    child: Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 25.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.phone,
                            color: Colors.teal.shade600,
                          ),
                          title: Text(
                            '+234 8142 2893 00',
                            style: TextStyle(
                                color: Colors.teal,
                                fontFamily: 'SourceSansPro',
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      launchEmailSubmission();
                    },
                    child: Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 25.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.email,
                            color: Colors.teal.shade600,
                          ),
                          title: Text(
                            'damanygt@gmail.com',
                            style: TextStyle(
                                color: Colors.teal,
                                fontFamily: 'SourceSansPro',
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURLApp(githubLink);
                    },
                    child: Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 5, horizontal: 25.0),
                        child: ListTile(
                          leading: Icon(
                            Icons.developer_mode,
                            color: Colors.teal.shade600,
                          ),
                          title: Text(
                            'www.github.com/Viktohblake',
                            style: TextStyle(
                                color: Colors.teal,
                                fontFamily: 'SourceSansPro',
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        primary: false,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SkillSet(),
                                  ),
                                );
                              },
                              splashColor: Colors.grey,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.engineering,
                                        size: 70, color: Colors.teal),
                                    Text("8 Skillsets",),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Project(),
                                  ),
                                );
                              },
                              splashColor: Colors.grey,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.work,
                                        size: 70, color: Colors.teal),
                                    Text("3 Projects done"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const WorkPage(),
                                  ),
                                );
                              },
                              splashColor: Colors.grey,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.person,
                                        size: 70, color: Colors.teal),
                                    Text("3 Work history"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Education(),
                                  ),
                                );
                              },
                              splashColor: Colors.grey,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.book,
                                        size: 70, color: Colors.teal),
                                    Text("3 Education history"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            _launchURLApp(twitterLink);
                          },
                          icon: Image.asset('images/twitter_icon.png'),),
                        IconButton(icon: Icon(Icons.telegram,),
                            onPressed: () {
                              // _launchURLApp(telegramLink);
                            }
                        ),
                        IconButton(onPressed: () {
                          _launchURLApp(instagramLink);
                        }
                            ,
                            icon: Image.asset(
                              'images/instagram_icon.png', fit: BoxFit.cover,))
                      ],
                    ),
                  ),

                ],
              ),
            ),
          );
        },
        initial: AdaptiveThemeMode.system,
        light: ThemeData(
          brightness: Brightness.light
        ),
        dark: ThemeData(
          brightness: Brightness.dark
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade800,
        onPressed: () { 
          AdaptiveTheme.of(context).toggleThemeMode();
        },
        child: Icon(Icons.toggle_off_outlined)
      ),
    );
  }
}
