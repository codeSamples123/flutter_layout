import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  'Oeschinen Lake Campground',
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Text(
                'Kandersteg, Switzerland',
                style: new TextStyle(
                  color: Colors.grey[500],
                ),
              )
            ],
          )),
          new FavoriteWidget(),
        ],
      ),
    );

    Column buildColumnButton(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return new Column(
        // TODO
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildColumnButton(Icons.call, 'CALL'),
          buildColumnButton(Icons.near_me, 'ROUTE'),
          buildColumnButton(Icons.share, "SHARE"),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.green,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Building Layout'),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }
}

// Some widgets are stateful, and some are stateless.
// If a widget changes — the user interacts with it, for example — it’s stateful.
// A widget’s state consists of values that can change, like a slider’s current
// value or whether a checkbox is checked.
// A widget’s state is stored in a State object, separating the widget’s state
// from its appearance.
// When the widget’s state changes, the state object calls setState(), telling
// the framework to redraw the widget.

// To create a custom stateful widget, subclass two classes: StatefulWidget and State.
// The state object contains the widget’s state and the widget’s build() method.
// When the widget’s state changes, the state object calls setState(),
// telling the framework to redraw the widget.
class FavoriteWidget extends StatefulWidget{
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      // If the lake is currently favored, unfavored it.
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
        // Otherwise, favorite it.
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: (_isFavorited
                ? new Icon(Icons.star)
                : new Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        // Placing the Text in a SizedBox and setting its width prevents
        // a discernible “jump” when the text changes between the values
        // of 40 and 41—this would otherwise occur because those values have
        // different widths.
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}
