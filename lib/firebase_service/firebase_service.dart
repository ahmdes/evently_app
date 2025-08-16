import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_project/Provider/config_provider.dart';
import 'package:evently_project/core/models/user_dm.dart';
import 'package:evently_project/core/resources/colors_manager.dart';
import 'package:evently_project/presentation/models/category_d_m.dart';
import 'package:evently_project/presentation/models/event_d_m.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../core/resources/dialog_utils.dart';
import '../core/routes/routes_manager.dart';

class FirebaseService {
  static CollectionReference<EventDM> getEventsCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventDM> collection =
        db.collection("events").withConverter(fromFirestore: (snapshot, _) {
      return EventDM.fromJson(snapshot.data()!);
    }, toFirestore: (event, _) {
      return event.toJson();
    });
    return collection;
  }

  static Future<void> addEventToFireStore(EventDM event) {
    CollectionReference<EventDM> collectionReference = getEventsCollection();
    DocumentReference<EventDM> document = collectionReference.doc();
    event.id = document.id;
    return document.set(event);
  }

  static Future<void> updateEvent(EventDM event) async {
    CollectionReference<EventDM> collectionReference = getEventsCollection();
    DocumentReference<EventDM> document = collectionReference.doc(event.id);
    await document.update(event.toJson());
  }

  static Future<List<EventDM>> getEventOneTimeRead(CategoryDM category) async {
    CollectionReference<EventDM> eventsCollection = getEventsCollection();
    QuerySnapshot<EventDM> querySnapshot = await eventsCollection
        .where("categoryId", isEqualTo: category.id == 0 ? null : category.id)
        .orderBy("dateTime")
        .get();
    List<QueryDocumentSnapshot<EventDM>> docSnapShot = querySnapshot.docs;
    List<EventDM> events =
        docSnapShot.map((docSnap) => docSnap.data()).toList();
    return events;
  }

  static Stream<List<EventDM>> getEventsRealTimeUpdates(
      CategoryDM category) async* {
    CollectionReference<EventDM> eventsCollection = getEventsCollection();
    Stream<QuerySnapshot<EventDM>> snapShots = eventsCollection
        .where("categoryId", isEqualTo: category.id == 0 ? null : category.id)
        .orderBy("dateTime")
        .snapshots();
    Stream<List<EventDM>> events = snapShots.map((querySnapShot) =>
        querySnapShot.docs.map((docSnapShot) => docSnapShot.data()).toList());

    yield* events;
  }

  static CollectionReference<UserDM> getUsersCollection() {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<UserDM> userCollection =
        db.collection("users").withConverter(
              fromFirestore: (snapShot, _) => UserDM.fromJson(snapShot.data()!),
              toFirestore: (userDM, _) => userDM.toJson(),
            );
    return userCollection;
  }

  static Future<List<EventDM>> getFavoriteEvents(BuildContext context) async {
    final eventCollection = getEventsCollection();
    final provider = Provider.of<ConfigProvider>(context, listen: false);
    final ids = provider.currentUser!.favoriteEvents;

    if (ids.isEmpty) {
      return [];
    }


    QuerySnapshot<EventDM> querySnapshot =
        await eventCollection.where(FieldPath.documentId, whereIn: ids).get();


    List<EventDM> favoriteList = querySnapshot.docs
        .map((eventSnapShot) => eventSnapShot.data())
        .toList();

    return favoriteList;
  }

  static Future<void> addUserToFireStore(UserDM user) {
    CollectionReference<UserDM> userCollection = getUsersCollection();
    DocumentReference<UserDM> userDoc = userCollection.doc(user.id);
    return userDoc.set(user);
  }

  static Future<void> signUp(
    String email,
    String password,
    BuildContext context,
    String name,
  ) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      UserDM userDM = UserDM(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        favoriteEvents: [],
      );
      await addUserToFireStore(userDM);
      DialogUtils.showLoadingDialog(context, message: "Successfully");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'The password provided is too weak.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: ColorsManager.light,
              ),
            ),
            backgroundColor: ColorsManager.grey,
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'The account already exists for that email.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: ColorsManager.light,
              ),
            ),
            backgroundColor: ColorsManager.grey,
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<UserDM> getUserFromFireStore(String id) async {
    CollectionReference<UserDM> userCollection = getUsersCollection();
    DocumentReference<UserDM> userDoc = userCollection.doc(id);
    DocumentSnapshot<UserDM> documentSnapshot = await userDoc.get();
    return documentSnapshot.data() as UserDM;
  }

  static Future<void> signIn(
      String email, String password, BuildContext context) async {
    try {
      ConfigProvider provider =
          Provider.of<ConfigProvider>(context, listen: false);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      UserDM user = await getUserFromFireStore(userCredential.user!.uid);
      provider.updateUserInfo(user);
      showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 3), () {
            Navigator.pop(context);
            Navigator.pushNamed(context, RoutesManager.mainLayout);
          });
          return AlertDialog(
              content: Row(
            children: [
              Text(
                "Waiting",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Spacer(),
              CircularProgressIndicator(
                color: ColorsManager.blue,
              ),
            ],
          ));
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Invalid email or password',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: ColorsManager.light,
            ),
          ),
          backgroundColor: ColorsManager.grey,
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: ColorsManager.light,
          ),
        ),
        backgroundColor: ColorsManager.grey,
      ));
    }
    //  return userCredential;
  }

  static Future<void> updateUser(UserDM userDM) {
    CollectionReference<UserDM> userCollection = getUsersCollection();
    DocumentReference<UserDM> userDoc = userCollection.doc(userDM.id);
    return userDoc.set(userDM);
  }

  static addEventsToFavorite(BuildContext context, String eventId) async {
    ConfigProvider provider =
        Provider.of<ConfigProvider>(context, listen: false);
    provider.currentUser!.favoriteEvents.add(eventId);
    await updateUser(provider.currentUser!);
  }

  static deleteEventsFromFavorite(BuildContext context, String eventId) async {
    ConfigProvider provider =
        Provider.of<ConfigProvider>(context, listen: false);
    provider.currentUser!.favoriteEvents.remove(eventId);
    await updateUser(provider.currentUser!);
  }

  static Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      ConfigProvider provider =
          Provider.of<ConfigProvider>(context, listen: false);

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      // تسجيل الدخول
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // جلب بيانات المستخدم من Firestore
      UserDM? existingUser;
      try {
        existingUser = await getUserFromFireStore(userCredential.user!.uid);
      } catch (_) {
        existingUser = null;
      }

      if (existingUser == null) {
        // أول مرة يدخل → أضفه ببيانات جديدة
        await addUserToFireStore(UserDM(
          id: userCredential.user!.uid,
          name: userCredential.user!.displayName ?? '',
          email: userCredential.user!.email ?? '',
          favoriteEvents: [],
        ));
        existingUser = await getUserFromFireStore(userCredential.user!.uid);
      }

      // تحديث البيانات في Provider
      provider.updateUserInfo(existingUser);

      Navigator.pushNamed(context, RoutesManager.mainLayout);

      return userCredential;
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  }

  static Future<void> deleteEvent(EventDM event) async {
    CollectionReference<EventDM> collectionReference = getEventsCollection();
    DocumentReference<EventDM> document = collectionReference.doc(event.id);
    await document.delete();
  }

  static Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

}
