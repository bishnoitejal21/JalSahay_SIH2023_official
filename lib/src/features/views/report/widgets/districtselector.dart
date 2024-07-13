import 'package:flutter/material.dart';

class DistrictSelector extends StatefulWidget {
  @override
  _DistrictSelectorState createState() => _DistrictSelectorState();
}

class _DistrictSelectorState extends State<DistrictSelector> {
  final List<String> states = [
    'Ernakulam',
    'Kannur',
    'Kollam',
    'Kozhikode',
    'Palakkad',
    'Thiruvananthapuram',
    'Wayanad',
    'Alappuzha',
    'Idukki',
    'Kasaragod',
    'Kottayam',
    'Malappuram',
    'Pathanamthitta',
    'Thrissur',
  ];

  String? selectedState;
  String searchQuery = '';
  List<String> filteredStates = [];

  @override
  void initState() {
    super.initState();
    filteredStates = states;
  }

  _filterStates(String query) {
    final filtered = states
        .where((state) => state.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredStates = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    var ph = MediaQuery.of(context).size.height;
    var pw = MediaQuery.of(context).size.width;
    return Container(
      // color: Colors.red,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      height: ph * 0.05,
      width: pw * 0.42,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedState,
                    hint: Row(
                      children: [
                        Icon(Icons.arrow_drop_down),
                        SizedBox(width: 5),
                        Text('District')
                      ],
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedState = newValue;
                      });
                    },
                    items: filteredStates
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    icon: SizedBox.shrink(), // This removes the default icon
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
