import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:resturantadminpanel/Model/user_model.dart';
import 'package:resturantadminpanel/Screen/home_page.dart';
import 'package:resturantadminpanel/Screen/login_page.dart';
import 'package:resturantadminpanel/service/database.dart';
import 'user_controller.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();
  User? get user => _firebaseUser.value;

  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }

  onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(
    String name,
    String contact,
    String branch,
    String email,
    String password,

    String image,
  ) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      //create user in database.dart
      UserModel _user = UserModel(
        id: _authResult.user!.uid,
        name: name,
        contact: contact,
        branch: branch,
        imagUrl: image,
        email: _authResult.user!.email!,
      );
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.offAll(Home());
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.to(Home());
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user!.uid);
    } catch (e) {
      Get.snackbar('Error Signing In', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.to(() => LoginMain());
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar('Error Signing Out', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
