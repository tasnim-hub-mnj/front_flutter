class AppLink {
  static const String server = "http://10.0.2.2:8000/api";
  // Auth
  static const String signUp = "$server/register";
  static const String login = "$server/login";
  static const String logout = "$server/logout";
  //Image
  static const String image = "http://10.0.2.2:8000/storage/";
  //OwnerProfile
  static const String updateProfile = "$server/profile";
  static const String addApartment = "$server/apartment";
  static const String getApartment = "$server/getAllApartments";
}
