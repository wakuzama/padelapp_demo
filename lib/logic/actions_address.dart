import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:padelapp_demo/model/address_entry.dart';

class UserLoadedAction {
  final FirebaseUser firebaseUser;

  UserLoadedAction(this.firebaseUser);
}

class AddDatabaseReferenceAction {
  final DatabaseReference databaseReference;

  AddDatabaseReferenceAction(this.databaseReference);
}

class AddEntryAction {
  final AddressEntry addressEntry;

  AddEntryAction(this.addressEntry);
}

class EditEntryAction {
  final AddressEntry addressEntry;

  EditEntryAction(this.addressEntry);
}

class RemoveEntryAction {
  final AddressEntry addressEntry;

  RemoveEntryAction(this.addressEntry);
}

class OnAddedAction {
  final Event event;

  OnAddedAction(this.event);
}

class OnChangedAction {
  final Event event;

  OnChangedAction(this.event);
}

class OnRemovedAction {
  final Event event;

  OnRemovedAction(this.event);
}

class AcceptEntryAddedAction {}

class AcceptEntryRemovalAction {}

class UndoRemovalAction {}

class InitAction {}