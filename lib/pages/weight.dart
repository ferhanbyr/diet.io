import 'package:diet_io/components/custom_textfield.dart';
import 'package:diet_io/pages/activity_selection.dart';
import 'package:flutter/material.dart';

class Weight extends StatefulWidget {
  const Weight({Key? key}) : super(key: key);

  @override
  _WeightState createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  final _formKey = GlobalKey<FormState>();
  final _boyController = TextEditingController();
  final _kiloController = TextEditingController();
  final _hedefKiloController = TextEditingController();
  double? _bmi;

  @override
  void initState() {
    super.initState();
    _boyController.addListener(_calculateBMI);
    _kiloController.addListener(_calculateBMI);
  }

  @override
  void dispose() {
    _boyController.removeListener(_calculateBMI);
    _kiloController.removeListener(_calculateBMI);
    _boyController.dispose();
    _kiloController.dispose();
    _hedefKiloController.dispose();
    super.dispose();
  }

  void _calculateBMI() {
    if (_boyController.text.isNotEmpty && _kiloController.text.isNotEmpty) {
      double height = double.parse(_boyController.text) / 100; // convert cm to m
      double weight = double.parse(_kiloController.text);
      setState(() {
        _bmi = weight / (height * height);
      });
    } else {
      setState(() {
        _bmi = null;
      });
    }
  }

  String _getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Zayıf';
    } else if (bmi < 25) {
      return 'Normal';
    } else if (bmi < 30) {
      return 'Fazla Kilolu';
    } else {
      return 'Obez';
    }
  }

  Color _getBMIColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.blue;
    } else if (bmi < 25) {
      return Colors.green;
    } else if (bmi < 30) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/brokoli.png',
                  height: 300,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'Boy (cm)',
                  controller: _boyController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen boyunuzu girin';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Geçerli bir sayı girin';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  label: 'Kilo (kg)',
                  controller: _kiloController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen kilonuzu girin';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Geçerli bir sayı girin';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  label: 'Hedef kilo (kg)',
                  controller: _hedefKiloController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen hedef kilonuzu girin';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Geçerli bir sayı girin';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                if (_bmi != null)
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: _getBMIColor(_bmi!).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: _getBMIColor(_bmi!)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Vücut Kitle İndeksi (BMI)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _getBMIColor(_bmi!),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${_bmi!.toStringAsFixed(1)}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: _getBMIColor(_bmi!),
                          ),
                        ),
                        Text(
                          _getBMICategory(_bmi!),
                          style: TextStyle(
                            fontSize: 16,
                            color: _getBMIColor(_bmi!),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 30),
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
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, navigate to ActivitySelectionPage
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ActivitySelection(
                              boy: _boyController.text,
                              kilo: _kiloController.text,
                              hedefKilo: _hedefKiloController.text,
                            ),
                          ),
                        );
                      }
                    },
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