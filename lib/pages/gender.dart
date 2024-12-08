import 'package:diet_io/pages/weight.dart';
import 'package:flutter/material.dart';

class GenderPage extends StatelessWidget {
  final String gender; // Gender bilgisini alacak değişken

  // Constructor ile gelen parametreyi alıyoruz
  const GenderPage({Key? key, required this.gender}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Image.asset('assets/images/brokoli.png'
              ,width: 400,
              height: 400,
              fit: BoxFit.contain),
              
                const Text(
                  'Cinsiyetiniz ne?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: "DynaPuff",
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),  
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Kadın figürü
                          GestureDetector(
                            onTap: () {
                              // Kadın figürüne tıklanma işlemi
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Weight(),
                                ),
                              );
                            },
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color:const Color.fromARGB(227, 156, 230, 71),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Icon(
                                Icons.woman_2_rounded, // Kadın simgesi
                                size: 70,
                                color: const Color.fromARGB(255, 31, 135, 52),
                              ),
                            ),
                          ),
                          // Erkek figürü
                          GestureDetector(
                            onTap: () {
                              // Erkek figürüne tıklanma işlemi
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Weight(),
                                ),
                              );
                            },
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color:const Color.fromARGB(227, 156, 230, 71),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Icon(
                                Icons.man_2_rounded, // Erkek simgesi
                                size: 70,
                                color: const Color.fromARGB(255, 31, 135, 52),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
