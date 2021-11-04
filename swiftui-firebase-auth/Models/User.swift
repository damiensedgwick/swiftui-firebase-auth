//
//  User.swift
//  swiftui-firebase-auth
//
//  Created by Damien K. Sedgwick on 04/11/2021.
//

import Firebase

struct User {
  let uid: String
  let email: String

  init(authData: Firebase.User) {
    uid = authData.uid
    email = authData.email ?? ""
  }

  init(uid: String, email: String) {
    self.uid = uid
    self.email = email
  }
}
