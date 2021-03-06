import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:thirsk_outer_space/event_feed/event_display.dart';
import 'package:thirsk_outer_space/general/general_functions.dart';
import 'package:thirsk_outer_space/strings/string_getter.dart';
import 'package:thirsk_outer_space/dev_function_page.dart';
import 'package:thirsk_outer_space/general/version_number.dart';
import 'package:thirsk_outer_space/general/common_widgets.dart';
import 'package:thirsk_outer_space/pages/home_page.dart';
import 'package:thirsk_outer_space/pages/thrive_page.dart';

// constants that hold all the resource links within thirskOS primarily on the thrive page, this is modular in the sense that it's easy to swap out links
// and add new ones when needed with little programing knowledge

// ///Don't steal my api key
//const String APP_API_KEY = "AIzaSyCE5gLyCtDW6dzAkPBowBdeXqAy5iw7ebY";

void main() {
  runApp(MyApp());
}


/// The page that contains the events posted by the teachers.
class EventPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container( child: ListView(
      children: <Widget>[


        new Image(image: new AssetImage('assets/title.png'), alignment: new Alignment(-0.87, -0.87),),

        new Container(
          height: 5.0,
        ),

        new Text("| Arts | Athletics | CTS | Wellness | ", style: new TextStyle(fontSize: 11, color: Colors.white, fontFamily: 'LEMONMILKLIGHT',letterSpacing: 4, ), textAlign: TextAlign.center,),

        new Container(
          height: 10.0,
        ),

        //OneEventPost(postJson: '',),
        AllEventPosts() //grabs post information (ask Roger)

      ],
    ));
  }
}  //Events Page

/// The core app.
class MyApp extends StatelessWidget {
  // This widget is the root of the application, the skeleton if you will.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]); //maintains vertical orientation
    getAppInfo();
    return new MaterialApp(
      title: "ThirskOS",
      color: Colors.grey,

      home: Builder(
        builder: (context) => DefaultTabController(
          initialIndex: 1,
          length: 3,

          child: new Scaffold(
              body: TabBarView(
                children: [
                  new Container(
                    child: new ThrivePage(
                      buttons: <ThriveButtonData>[
                        ThriveButtonData('CLUBS',(){launchURL(clubURL);}),
                        ThriveButtonData('FINE ARTS',(){launchURL(faURL);}),
                        ThriveButtonData('CTS',(){goToPage(context, CtsPage());}),
                        ThriveButtonData('SPORTS',(){goToPage(context, SportsPage());}),
                        ThriveButtonData('THE DOCK',(){launchURL(dockURL);}),
                        ThriveButtonData('EDVENTURE',(){launchURL(edURL);}),
                        ThriveButtonData('CONNECT NEWSLETTER',(){launchURL(connectURL);}),
                        ThriveButtonData('TEACHER CONTACT LIST',(){launchURL(staffURL);}),
                        ThriveButtonData('CAREER OPPOTUNITY',(){launchURL(coURL);}),
                        ThriveButtonData('SCHOLARSHIP',(){launchURL(scholarURL);}),
                        ThriveButtonData('DIPLOMA EXAMS',(){goToPage(context, DiplomaPage());}),
                        ThriveButtonData('GRADUATION',(){launchURL(gradURL);}),
                        ThriveButtonData('POSTSECONDARY',(){launchURL(psURL);}),
                        ThriveButtonData('SECRET OPTIONS',(){goToPage(context, MarkdownTest());}),

                      ],
                      initColor: Colors.lightBlue[300],
                      finalColor: Colors.purple,
                    ),
                    padding: EdgeInsets.all(10),
                    color: Colors.grey[800],
                  ),

                  new Container(
                    child: new HomePage(),
                    padding: EdgeInsets.all(10),
                    color: Colors.grey[800],
                  ),

                  new Container(
                    child: new EventPage(),
                    padding: EdgeInsets.all(10),
                    color: Colors.grey[800],

                  ),

                  //containers of the three pages

                ],
              ),
              bottomNavigationBar: new TabBar( //creates bottom navigation bar
                tabs: [
                  Tab(
                    child: new NavigationButton(buttonImage: 'assets/thrive.png', buttonText: getString('thrive/button')),
                  ),

                  Tab(
                    child: new NavigationButton(buttonImage: 'assets/home.png', buttonText: getString('home/button')),
                  ),

                  Tab(
                    child: new NavigationButton(buttonImage: 'assets/event.png', buttonText: getString('event/button')),

                  ),

                ],
                //labelColor: Colors.blue,
                //unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.all(20),
                indicatorPadding: EdgeInsets.all(6.0),
                indicatorColor: Colors.white,
              ),
              backgroundColor: Colors.grey[850]// Color(0xFF2D2D2D), //app background colour
          ),
        ),
      ),

      //theme: ThemeData(fontFamily: 'LEMONMILKLIGHT'),
      theme: ThemeData(textTheme: TextTheme(
          body1: TextStyle(fontSize: 14,color: Colors.white)
      )),
    );
  }
} //Skeleton of the UI


//fonts, image assets, and dependencies are listed in the pubspec.yaml file