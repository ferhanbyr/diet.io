import 'package:diet_io/components/custom_date.dart';
import 'package:flutter/material.dart';


class DatePage extends StatefulWidget {
  final Map<String, String> userData;

  const DatePage({
    Key? key,
    required this.userData,
  }) : super(key: key);

  @override
  _BirthDatePageState createState() => _BirthDatePageState();
}

class _BirthDatePageState extends State<DatePage> {
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  @override
  void dispose() {
    _dayController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue.shade200),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Broccoli Character
              SizedBox(
                height: 200,
                child: Image.asset(
                  'assets/images/brokoli.png',
                  fit: BoxFit.contain,
                  
                ),
              ),
              const SizedBox(height: 40),
              
              // Question Text
              const Text(
                'Doğum tarihiniz ne?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'DynaPuff'
                ),
              ),
              const SizedBox(height: 40),
              
              // Date Input Fields
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF8BC34A),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomDate(
                      label: 'Gün',
                      controller: _dayController,
                    ),
                    CustomDate(
                      label: 'Ay',
                      controller: _monthController,
                    ),
                    CustomDate(
                      label: 'Yıl',
                      controller: _yearController,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              
              // Forward Button
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF8BC34A),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (_dayController.text.isNotEmpty &&
                        _monthController.text.isNotEmpty &&
                        _yearController.text.isNotEmpty) {
                      // Add birth date to userData
                      final updatedUserData = Map<String, String>.from(widget.userData);
                      updatedUserData['birthDate'] = '${_dayController.text}/${_monthController.text}/${_yearController.text}';
                      
                      // Print all data for demonstration
                      print('User Data: $updatedUserData');
                      
                      // Navigate to next page or process data
                      // Navigator.of(context).push(...);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}