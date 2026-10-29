import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _civilStatusController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  
  void _register() {
    if (_fullnameController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmController.text.isEmpty ||
        _genderController.text.isEmpty ||
        _civilStatusController.text.isEmpty ||
        _birthdateController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please fill out all the fields')),
          );
          return; 
   }
  if ( _passwordController.text != _confirmController.text) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password and confirm password do not match')),
    );
    return;
  }
    Navigator.pop(context);
  }
    InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Diano Activity 2 - Register')
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:[
          TextField(
            controller: _fullnameController,
            decoration: _inputDecoration('Full Name', Icons.person),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _usernameController,
            decoration: _inputDecoration('Username', Icons.person),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: _inputDecoration('Password', Icons.lock),
          ),
          const SizedBox(height: 15),
          TextField(    
            controller: _confirmController,
            obscureText: true,
            decoration: _inputDecoration('Confirm Password', Icons.lock),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _genderController,
            decoration: _inputDecoration('Gender', Icons.person),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _civilStatusController,
            decoration: _inputDecoration('Civil Status', Icons.person),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _birthdateController,
            decoration: _inputDecoration('Birthdate', Icons.calendar_today),
            onTap: () async{
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime(2025),
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (pickedDate != null) {
                setState(() {
                  _birthdateController.text = 
                  "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
                });
              }
            }
          ), 
          const SizedBox(height: 25),

          ElevatedButton(onPressed: _register,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
              ),
          ),
          child: const Text('Register', 
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          )
          )
          ],
        ),
      ),
    );
  }
}