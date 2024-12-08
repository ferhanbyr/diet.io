import 'package:diet_io/components/custom_selection.dart';
import 'package:diet_io/pages/date_page.dart';
import 'package:flutter/material.dart';


class ActivitySelection extends StatefulWidget {
  const ActivitySelection({Key? key, required String boy, required String kilo, required String hedefKilo}) : super(key: key);

  @override
  _ActivitySelectionPageState createState() => _ActivitySelectionPageState();
}

class _ActivitySelectionPageState extends State<ActivitySelection> {
  String? selectedActivity;

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
              Image.asset(
                'assets/images/brokoli.png',
                height: 300,
                fit: BoxFit.contain,
                
              ),
              const SizedBox(height: 40),
              
              // Activity Selection Buttons
              CustomSelection(
                text: 'Aktif',
                isSelected: selectedActivity == 'Aktif',
                onTap: () => setState(() => selectedActivity = 'Aktif'),
              ),
              const SizedBox(height: 15),
              
              CustomSelection(
                text: 'Az aktif',
                isSelected: selectedActivity == 'Az aktif',
                onTap: () => setState(() => selectedActivity = 'Az aktif'),
              ),
              const SizedBox(height: 15),
              
              CustomSelection(
                text: 'Aktif değil',
                isSelected: selectedActivity == 'Aktif değil',
                onTap: () => setState(() => selectedActivity = 'Aktif değil'),
              ),
              const SizedBox(height: 50),
              
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
                    if (selectedActivity != null) {
                     Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DatePage(
                               userData: {
                              'activity': selectedActivity!,
                            },
                            ),
                          ),
                        ); // Navigate to next page or process selection
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