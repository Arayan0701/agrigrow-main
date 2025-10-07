import 'package:flutter/material.dart';

class DeliveryAddressPage extends StatefulWidget {
  @override
  _DeliveryAddressPageState createState() => _DeliveryAddressPageState();
}

class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();

  String? _selectedState;
  String? _selectedCity;
  
  final List<String> _states = [
    'Sleet State',
    'Farm State',
    'Green State',
    'Agricultural State',
    'Harvest State'
  ];
  
  final Map<String, List<String>> _citiesByState = {
    'Sleet State': ['Sleet City', 'Frost Town', 'Snow Village'],
    'Farm State': ['Farm City', 'Crop Town', 'Harvest Village'],
    'Green State': ['Green City', 'Eco Town', 'Nature Village'],
    'Agricultural State': ['Agri City', 'Cultivation Town', 'Produce Village'],
    'Harvest State': ['Harvest City', 'Yield Town', 'Crop Village'],
  };

  @override
  void initState() {
    super.initState();
    // Load user data
    _loadUserData();
  }

  void _loadUserData() {
    // Simulating loading user data
    setState(() {
      _fullNameController.text = "Agri Grow";
      _mobileNumberController.text = "+91 9725853306";
      _selectedState = "Sleet State";
      _selectedCity = "Select City";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new address"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Delivery Address"),
              SizedBox(height: 20),
              _buildLabel("Full name:"),
              SizedBox(height: 8),
              _buildReadOnlyField(_fullNameController.text),
              SizedBox(height: 16),
              _buildLabel("Mobile number:"),
              SizedBox(height: 8),
              _buildReadOnlyField(_mobileNumberController.text),
              SizedBox(height: 20),
              _buildLabel("State:"),
              SizedBox(height: 8),
              _buildDropdownField(
                value: _selectedState,
                items: _states,
                hint: "Select State",
                onChanged: (value) {
                  setState(() {
                    _selectedState = value;
                    _selectedCity = "Select City"; // Reset city when state changes
                  });
                },
              ),
              SizedBox(height: 16),
              _buildLabel("City:"),
              SizedBox(height: 8),
              _buildDropdownField(
                value: _selectedCity,
                items: _selectedState != null && _selectedState != "Select State"
                    ? _citiesByState[_selectedState]!
                    : ["Select City"],
                hint: "Select City",
                onChanged: (value) {
                  setState(() {
                    _selectedCity = value;
                  });
                },
              ),
              SizedBox(height: 20),
              _buildLabel("Street (include house number):"),
              SizedBox(height: 8),
              _buildTextField(
                controller: _streetController,
                hint: "Enter your street address",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your street address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _saveAddress();
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Save Address",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.grey[700],
      ),
    );
  }

  Widget _buildReadOnlyField(String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[100],
      ),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String? value,
    required List<String> items,
    required String hint,
    required Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]!),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    color: value == "Select State" || value == "Select City" 
                        ? Colors.grey 
                        : Colors.black87,
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }

  void _saveAddress() {
    // Save address logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Address saved successfully'),
        duration: Duration(seconds: 2),
      ),
    );
    
    // In a real app, you would save to database/API here
    print('Full Name: ${_fullNameController.text}');
    print('Mobile Number: ${_mobileNumberController.text}');
    print('State: $_selectedState');
    print('City: $_selectedCity');
    print('Street: ${_streetController.text}');
    
    // Navigate back after saving
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _mobileNumberController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _streetController.dispose();
    super.dispose();
  }
}