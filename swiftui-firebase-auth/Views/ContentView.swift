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

  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)

      EmailAndPasswordFormView(emailAddress: $emailAddress, password: $password)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
