class StudentModel {
  final String? firstName;
  final String? lastName;
  final String? favoriteLanguage;

  StudentModel({
    required this.firstName,
    required this.lastName,
    required this.favoriteLanguage,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        firstName: json['firstName']?.toString(),
        lastName: json['lastName']?.toString(),
        favoriteLanguage: json['favoriteLanguage']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'favoriteLanguage': favoriteLanguage,
      };
}
