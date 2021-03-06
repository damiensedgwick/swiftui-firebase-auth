//
//  ContentView.swift
//  swiftui-firebase-auth
//
//  Created by Damien K. Sedgwick on 03/11/2021.
//

import SwiftUI

struct ContentView: View {
  @State var emailAddress: String = ""
  @State var password: String = ""

  @State var userIsSignedIn: Bool = false

  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)

      if userIsSignedIn == true {
        DashboardView(userIsSignedIn: $userIsSignedIn)
      } else {
        EmailAndPasswordFormView(emailAddress: $emailAddress, password: $password, userIsSignedIn: $userIsSignedIn)
      }

    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
