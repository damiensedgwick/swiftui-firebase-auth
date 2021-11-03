//
//  swiftui_firebase_authApp.swift
//  swiftui-firebase-auth
//
//  Created by Damien K. Sedgwick on 03/11/2021.
//

import SwiftUI
import Firebase

@main
struct swiftui_firebase_authApp: App {

  init() {
    FirebaseApp.configure()
  }

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
