import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:your_eyes/login/login_screen.dart';
import 'package:your_eyes/shared/components.dart';
import 'package:your_eyes/shared/conestant.dart';
import 'package:your_eyes/shared/styles/colors.dart';

class BoardingModel{
  late final String image;
  late final String title;
  late final String description;


  BoardingModel({
    required this.image,
    required this.title,
    required this.description,

});
}


class onBoardingScreen extends StatefulWidget {
  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
 // const onBoardingScreen({Key? key}) : super(key: key);
  List<BoardingModel>boarding=
      [
        BoardingModel(
            image: 'assets/images/welcome.jpg',
            title: 'Welcome to your Eyes',
            description: 'We are here to help you make your life easier',

        ),
        BoardingModel(
          image: 'assets/images/detectColor.jpg',
          title: 'Color Detection',
          description: 'Recognize the color of the object',

        ),
        BoardingModel(
          image: 'assets/images/distance.jpg',
          title: 'Detect Distance',
          description: 'Set the distance between you and the person',

        ),
        BoardingModel(
          image: 'assets/images/detectPerson.jpg',
          title: 'Person Detection',
          description: 'Recognize the person in front of you',
        ),
        BoardingModel(
          image: 'assets/images/readCurrency.jpg',
          title: 'Read Currency',
          description: 'Specifies the type of currency',

        ),
        BoardingModel(
          image: 'assets/images/readText.jpg',
          title: 'Read Text',
          description: 'Read the text, page or pdf',

        ),
        BoardingModel(
          image: 'assets/images/readLibrary.jpg',
          title: 'Read Library',
          description: 'Read a book from your library choose the book and application will read it',

        ),
        BoardingModel(
          image: 'assets/images/findObject.jpg',
          title: 'Find',
          description: 'Select an item and the camera will open to detect it',

        ),

      ];

  var boardController= PageController();
  late String titleOfButton="start";
  bool isLast=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 32.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 23.0,
                ),
                firstName,
                SizedBox(
                  width: 4.5,
                ),
                secondName,
              ],
            ),
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),

                itemBuilder:(context,index)=>buildBoardingItem(boarding[index]),
                controller: boardController,
                onPageChanged: (int index){
                  if(index==boarding.length-1)
                  {
                      setState(() {
                        isLast=true;
                        titleOfButton='Get Started';
                      });
                    print(titleOfButton);
                    }
                  else if(index==0)
                  {
                    setState(() {
                      isLast=false;
                      titleOfButton='Start';
                    });
                    print(titleOfButton);
                  }
                  else
                  {
                    setState(() {
                      isLast=false;
                      titleOfButton='Next';
                    });
                    print(titleOfButton);
                  }

                },
                itemCount: boarding.length,

              ),
            ),
            SizedBox(
              height: 97.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmoothPageIndicator(
                    effect:SlideEffect(
                      spacing : 10,
                      radius : 4,
                      dotWidth : 61,
                      dotHeight : 8,
                      activeDotColor: baseColor,

                    ),
                    controller: boardController,
                    count: boarding.length),
              ],
            ),
            SizedBox(
              height: 20.0, // mai bt2ol 97
            ),
            Row(
              children: [
                Expanded(
                  child:TextButton(
                    onPressed: () {
                      if(isLast)
                        {
                          navigateAndFinish(context, LoginScreen());
                        }
                      else{
                        boardController.nextPage(
                            duration: Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn
                        );
                      }



                    },
                    child: Text(

                      titleOfButton.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                    style:
                     // another shape for button 3la m-ntf2
                    //  ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor:baseColor ),
                    ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(25)),// fe mo4kla f height al button mai bt2ol 50
                        backgroundColor: MaterialStateProperty.all<Color>(baseColor),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.black)

                            )
                        )

                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 39.0,
            )
          ],
        ),

      ),
    );
  }
}

Widget buildBoardingItem(BoardingModel model)=>Column(
  children: [
    Expanded(
      child: Image(
        image:AssetImage('${model.image}'),
      ),
    ),
    Text(
      '${model.title}',
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,

      ),
    ),
    SizedBox(
      height: 16.0,
    ),
    Text(
      '${model.description}',
      style: TextStyle(
          fontSize: 13,
          color: Colors.grey[600] //HexColor('160E0E') mai bt2ol de dargto
      ),

    ),
    SizedBox(
      height: 68.0,
    ),
    Text('Sound'),

  ],
);