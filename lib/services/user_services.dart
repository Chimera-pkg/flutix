part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(User user) async {
    String genre = "";

    for (var genre in user.selectedGenres) {
      genre += genre + ((genre != user.selectedGenres.last) ? ',' : '');
    }

    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguange': user.selectedLanguage,
      'userProfilePicture': user.profilePicture ?? "",
    });
  }

  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return User(id, snapshot['email'],
        balance: snapshot['balance'],
        profilePicture: snapshot['profilePicture'],
        selectedGenres: (snapshot['selectedGenres'] as List)
            .map((e) => e.toString())
            .toList(),
        selectedLanguage: snapshot['selectedLanguange'],
        name: snapshot['name']);
  }
}
