import 'package:diet_io/components/my_card.dart';
import 'package:flutter/material.dart';
import 'package:diet_io/pages/gender.dart';

class Choice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50), 
            
              const Text(
                'Aklında ne gibi bir hedef var?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35,
                  fontFamily: "DynaPuff",
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 60),
              MyCard(
                color:const Color.fromARGB(227, 156, 230, 71),
                text: 'Kilo alma', onTap: () { 
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GenderPage(gender: 'Kilo Alma')),
                  );
                   },
                 imagePath: 'assets/images/brokoli.png',
              ),
              SizedBox(height: 25),
              MyCard(
                color: const Color.fromARGB(216, 255, 153, 0),
                text: 'Kilo verme', onTap: () {  },
                imagePath: 'assets/images/mango.png',
                
              ),
              SizedBox(height: 25),
                  MyCard(
                color: const Color.fromARGB(200, 243, 68, 68),
                text: 'Sağlıklı beslenme', onTap: () {  },
                imagePath: 'assets/images/elma.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
