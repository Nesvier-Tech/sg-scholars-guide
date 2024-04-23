import 'package:cloud_firestore/cloud_firestore.dart';

var db = FirebaseFirestore.instance;

final accountRoles = [
  // Administrator.
  {
    "uuid": "administrator",
    "name": "Administrator",
    "description": "This role has full access to the application.",
    "AddedByRef": "GpfoPSnxtoWTHyGqkBL6lN8N2823",
    "AddedOn": DateTime.now(),
    "UpdatedByRef": "GpfoPSnxtoWTHyGqkBL6lN8N2823",
    "UpdatedOn": DateTime.now(),
    "DeletedByRef": null,
    "DeletedOn": null,
  },

  // Moderator.
  {
    "uuid": "moderator",
    "name": "Moderator",
    "description": "This role has limited access to the application.",
    "AddedByRef": "GpfoPSnxtoWTHyGqkBL6lN8N2823",
    "AddedOn": DateTime.now(),
    "UpdatedByRef": "GpfoPSnxtoWTHyGqkBL6lN8N2823",
    "UpdatedOn": DateTime.now(),
    "DeletedByRef": null,
    "DeletedOn": null,
  },

  // Regular.
  {
    "uuid": "regular",
    "name": "Regular",
    "description": "This role has the least access to the application.",
    "AddedByRef": "GpfoPSnxtoWTHyGqkBL6lN8N2823",
    "AddedOn": DateTime.now(),
    "UpdatedByRef": "GpfoPSnxtoWTHyGqkBL6lN8N2823",
    "UpdatedOn": DateTime.now(),
    "DeletedByRef": null,
    "DeletedOn": null,
  },

  // Guest.
  {
    "uuid": "guest",
    "name": "Guest",
    "description": "This role has no access to the application.",
    "AddedByRef": "GpfoPSnxtoWTHyGqkBL6lN8N2823",
    "AddedOn": DateTime.now(),
    "UpdatedByRef": "GpfoPSnxtoWTHyGqkBL6lN8N2823",
    "UpdatedOn": DateTime.now(),
    "DeletedByRef": null,
    "DeletedOn": null,
  },

  // Anonymous.
  {
    "uuid": "anonymous",
    "name": "Anonymous",
    "description": "This role has no access to the application.",
    "AddedByRef": "GpfoPSnxtoWTHyGqkBL6lN8N2823",
    "AddedOn": DateTime.now(),
    "UpdatedByRef": "GpfoPSnxtoWTHyGqkBL6lN8N2823",
    "UpdatedOn": DateTime.now(),
    "DeletedByRef": null,
    "DeletedOn": null,
  },

  // Banned.
  {
    "uuid": "banned",
    "name": "Banned",
    "description": "This role has no access to the application.",
    "AddedByRef": "GpfoPSnxtoWTHyGqkBL6lN8N2823",
    "AddedOn": DateTime.now(),
    "UpdatedByRef": "GpfoPSnxtoWTHyGqkBL6lN8N2823",
    "UpdatedOn": DateTime.now(),
    "DeletedByRef": null,
    "DeletedOn": null,
  },

  // Suspended.
  {
    "uuid": "suspended",
    "name": "Suspended",
    "description": "This role has no access to the application.",
    "AddedByRef": "GpfoPSnxtoWTHyGqkBL6lN8N2823",
    "AddedOn": DateTime.now(),
    "UpdatedByRef": "GpfoPSnxtoWTHyGqkBL6lN8N2823",
    "UpdatedOn": DateTime.now(),
    "DeletedByRef": null,
    "DeletedOn": null,
  },
];

Future<void> seedAccountRoles() async {
  for (var accountRole in accountRoles) {
    await db
        .collection("AccountRoles")
        .doc(accountRole["uuid"] as String?)
        .set(accountRole);
  }
}

void main() async {
  await seedAccountRoles();
}
