import 'dart:ui';

import 'package:flutter/material.dart';

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 17, 35),
                    Color.fromARGB(255, 10, 35, 78),
                    Color.fromARGB(255, 37, 62, 107)
                  ],
                  stops: [
                    0.04,
                    0.5,
                    0.8
                  ],
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(25.0))),
        ),
        title: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 30.0),
            //alignment: Alignment.bottomLeft,
            child: Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        toolbarHeight: 110,
      ),
      body: Container(
        child: Column(
          children: [
            //2 box
            AspectRatio(
              //responsive
              aspectRatio: 1,
              child: SizedBox(
                child: GridView.builder(
                    itemCount: 2,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 6,
                                  offset: Offset(0, 4)),
                            ],
                          ),
                          child: Container(
                            child: Center(
                              child: Container(
                                child: Text(
                                  'Actual Temperature',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 10, 35, 78),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            //iconos
                          ),
                        ),
                      );
                    }),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black54,
                                blurRadius: 6,
                                offset: Offset(0, 4)),
                          ],
                        ),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
