import 'package:devoir_2024/models/string.dart';
import 'package:flutter/material.dart';
import '../models/candidate.dart';

class AddCandidatePage extends StatefulWidget {
  @override
  _AddCandidatePageState createState() => _AddCandidatePageState();
}

class _AddCandidatePageState extends State<AddCandidatePage> {
  final _formKey = GlobalKey<FormState>();

  // Contrôleurs pour les champs du formulaire
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _descriptionController = TextEditingController();

  // Contrôleur pour le champ de date de naissance
  final _birthdateController = TextEditingController();

  // Variable pour stocker la date de naissance sélectionnée
  DateTime? _selectedBirthdate;

  // Fonction pour sélectionner la date de naissance
  Future<void> _selectBirthdate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedBirthdate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedBirthdate) {
      setState(() {
        _selectedBirthdate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Création de Candidat'
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: Strings.firstNameLabel),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.requiredFieldError;
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: Strings.lastNameLabel),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.requiredFieldError;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: Strings.descriptionLabel),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Strings.requiredFieldError;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Date de naissance',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      _selectBirthdate(context);
                    },
                  ),
                ),
                child: TextFormField(
                  controller: _birthdateController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  validator: (value) {

                  },
                  onTap: () {
                    _selectBirthdate(context);
                  },
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Candidate newCandidate = Candidate(
                      firstName: _firstNameController.text,
                      lastName: _lastNameController.text,
                      description: _descriptionController.text,
                      birthdate: _selectedBirthdate,
                    );
                    Navigator.pop(context, newCandidate);
                  }
                },
                child: Text(Strings.saveButtonLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
