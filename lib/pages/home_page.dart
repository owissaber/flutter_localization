import 'package:flutter/material.dart';
import 'package:flutter_localization_master/classes/language.dart';
import 'package:flutter_localization_master/localization/language_constants.dart';
import 'package:flutter_localization_master/main.dart';
import 'package:flutter_localization_master/router/route_constants.dart';
import 'package:flutter_localization_master/screensapp/moqadema.dart';

import '../router/route_constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState();
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  // void _showSuccessDialog() {
  //   showTimePicker(context: context, initialTime: TimeOfDay.now());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFc8e6c9),
      appBar: AppBar(
        backgroundColor: Color(0xFF1b5e20),
        centerTitle: true,
        title: Text(getTranslated(context, 'home_page')),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              onChanged: (Language language) {
                _changeLanguage(language);
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: _drawerList(),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              ButtonPages(
                btnTitle: 'name',
                pageTitle: 'home_page',
                textTitle: 'personal_information',
                pageText: 'about',
              ),
            ],
          )),
    );
  }

  Widget _btnPages(
      BuildContext context, btnTitle, pageTitle, textTitle, pageText) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: MaterialButton(
          height: 50,
          color: Color(0xff2e7d32),
          shape: StadiumBorder(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MoqademaScreen(
                  pageTitle: pageTitle,
                  textTitle: textTitle,
                  pageText: pageText,
                ),
              ),
            );
          },
          child: Text(
            getTranslated(context, btnTitle),
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
      ),

      // Container(
      //   height: MediaQuery.of(context).size.height / 4,
      //   child: Center(
      //     child: Text(
      //       getTranslated(context, 'personal_information'),
      //       // DemoLocalization.of(context).translate('personal_information'),
      //       textAlign: TextAlign.center,
      //       style: TextStyle(
      //         fontSize: 30,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ),
      // TextFormField(
      //   validator: (val) {
      //     if (val.isEmpty) {
      //       return getTranslated(context, 'required_field');
      //       // return DemoLocalization.of(context).translate('required_fiedl');
      //     }
      //     return null;
      //   },
      //   decoration: InputDecoration(
      //     border: OutlineInputBorder(),
      //     labelText: getTranslated(context, 'name'),
      //     hintText: getTranslated(context, 'name_hint'),
      //   ),
      // ),
      // SizedBox(
      //   height: 10,
      // ),
      // TextFormField(
      //   validator: (val) {
      //     if (val.isEmpty) {
      //       return getTranslated(context, 'required_field');
      //     }
      //     return null;
      //   },
      //   decoration: InputDecoration(
      //     border: OutlineInputBorder(),
      //     labelText: getTranslated(context, 'email'),
      //     hintText: getTranslated(context, 'email_hint'),
      //   ),
      // ),
      // SizedBox(
      //   height: 10,
      // ),
      // TextFormField(
      //   decoration: InputDecoration(
      //       border: OutlineInputBorder(),
      //       hintText: getTranslated(context, 'date_of_birth')),
      //   onTap: () async {
      //     FocusScope.of(context).requestFocus(FocusNode());
      //     await showDatePicker(
      //       context: context,
      //       initialDate: DateTime.now(),
      //       firstDate: DateTime(DateTime.now().year),
      //       lastDate: DateTime(DateTime.now().year + 20),
      //     );
      //   },
      // ),
      // SizedBox(
      //   height: 10,
      // ),
    );
  }

  Container _drawerList() {
    TextStyle _textStyle = TextStyle(
      color: Colors.white,
      fontSize: 24,
    );
    return Container(
      color: Color(0xff33691e),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              height: 100,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/mohamed.jpg'),
                backgroundColor: Color(0xff33691e),
                // child: Image.asset('assets/images/mohamed.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              getTranslated(context, 'about_us'),
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              getTranslated(context, 'settings'),
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
        ],
      ),
    );
  }
}

class ButtonPages extends StatelessWidget {
  final String btnTitle;
  final String pageTitle;
  final String textTitle;
  final String pageText;

  ButtonPages(
      {@required this.btnTitle,
      @required this.pageTitle,
      @required this.textTitle,
      @required this.pageText});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: MaterialButton(
          height: 50,
          color: Color(0xff2e7d32),
          shape: StadiumBorder(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MoqademaScreen(
                  pageTitle: pageTitle,
                  textTitle: textTitle,
                  pageText: pageText,
                ),
              ),
            );
          },
          child: Text(
            getTranslated(context, btnTitle),
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
