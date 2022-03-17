part of 'extensions.dart';

extension FirebaseUserExtension on auth.User {
  User convertToUser(
          {String name = "No Name",
          List<String> selectedGenres = const [],
          String SelectedLanguage = "English",
          int balance = 50000}) =>
      User(this.uid, this.email,
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguage: SelectedLanguage);

  Future<User> fromFireStore() async => await UserServices.getUser(this.uid);
}
