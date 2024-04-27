class Candidate {

  final String firstName;
  final String lastName;
  final String description;
  final  DateTime? birthdate;


  Candidate({

    required this.firstName,
    required this.lastName,
     this.birthdate,
    required this.description
  });
}
