import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/controllers/swipe/swipe_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce/src/widgets/components/backgrounds.dart';
import 'package:flutter_ecommerce/src/controllers/swipe/gesture_card_deck.dart';

class SwipeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwipeScreenSate();
  }
}

class _SwipeScreenSate extends State<SwipeScreen> {
  @override
  Widget build(BuildContext context) {
    final _swipeData = Provider.of<SwipeService>(context);
    
    if (_swipeData.isSwipeLoaded == null) {
      _swipeData.loadSwipe();
    }

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/login');
      },
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          return Container(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                BackgroundImageBlur(),
                Center(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 40.0,
                          ),
                          Text(
                            'Choose interested',
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            'themes',
                            style: Theme.of(context).textTheme.title,
                          ),
                          Container(
                            width: 410,
                            height: 600,
                            child: GestureCardDeck(
                              isButtonFixed: true,
                              fixedButtonPosition: Offset(50, 480),
                              data: _swipeData.getSwipeCards,
                              animationTime: Duration(milliseconds: 500),
                              showAsDeck: true,
                              velocityToSwipe: 1200,
                              leftSwipeButton: Container(
                                height: 50,
                                width: 150,
/*                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(61, 135, 160, 1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    )),*/
                                child: Center(
                                  child: Icon(
                                    Icons.clear,
                                    size: 60.0,
                                  ),
                                ),
                                //Center(child: Text("NOPE", style: TextStyle(color: Colors.white))),
                              ),
                              rightSwipeButton: Container(
                                height: 50,
                                width: 150,
                                /*                 decoration: BoxDecoration(
                                    color: Color.fromRGBO(95, 169, 194, 1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    )),*/
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    size: 60.0,
                                    color: Theme.of(context).buttonColor,
                                  ),
                                ),
                                //Center(child: Text("YEAH", style: TextStyle(color: Colors.white))),
                              ),
                              onSwipeLeft: (index) {
                                print("on swipe left");
                                print(index);
                              },
                              onSwipeRight: (index) {
                                print("on swipe right");
                                print(index);
                              },
                              onCardTap: (index) {
                                print("on card tap");
                                print(index);
                              },
                              leftPosition: 50,
                              topPosition: 10,
                              leftSwipeBanner: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Transform.rotate(
                                  angle: 0.5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.red, width: 2.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("NOPE",
                                          style: TextStyle(
                                              fontSize: 24,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                              ),
                              rightSwipeBanner: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Transform.rotate(
                                  angle: -0.5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.green, width: 2.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("YEAH",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
