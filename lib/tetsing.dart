import 'package:flutter/material.dart';

import 'AppLayer/Overseer.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: new AppBar(
      //   title: new Text('Search'),
      // ),
      body: SingleChildScrollView(
        child: new GestureDetector(
          behavior: HitTestBehavior.opaque,
          onPanDown: (detail) {
            print(detail);
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child:
              new Container(
                child: new ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, _index) {
                    return new Column(
                      children: <Widget>[
                        new Container(
                          height: 50.0,
                          color: Colors.green,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Icon(Icons.format_list_numbered,
                                  color: Colors.white),
                              new Padding(
                                  padding: const EdgeInsets.only(right: 5.0)),
                              new Text("${Overseer.categoryCoursesName.values.elementAt(_index)}",
                                  style: new TextStyle(
                                      fontSize: 20.0, color: Colors.white)),
                            ],
                          ),
                        ),
                        new Container(
                          height: 150.0,
                          child: _index == 0 ? new ListView.builder(
                            // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return new GestureDetector(
                                child: new Card(
                                  elevation: 5.0,
                                  child: new Container(
                                    height: MediaQuery.of(context).size.width / 3,
                                    width: MediaQuery.of(context).size.width / 3,
                                    alignment: Alignment.center,
                                    child: new Text('news $index'),
                                  ),
                                ),
                                onTap: () {
                                  print(123);
                                },
                              );
                            },
                          ): _index == 1 ? Text("Waleed"):new ListView.builder(
                            // shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return new GestureDetector(
                                child: new Card(
                                  elevation: 5.0,
                                  child: new Container(
                                    height: MediaQuery.of(context).size.width / 3,
                                    width: MediaQuery.of(context).size.width / 3,
                                    alignment: Alignment.center,
                                    child: new Text('Item $index'),
                                  ),
                                ),
                                onTap: () {
                                  print(123);
                                },
                              );
                            },
                          ),
                        ),
                        new SizedBox(height: 20.0),
                      ],
                    );
                  },
                ),
              ),

        ),
      ),
    );
  }
}
