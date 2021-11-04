//
//  DashboardView.swift
//  swiftui-firebase-auth
//
//  Created by Damien K. Sedgwick on 04/11/2021.
//

import SwiftUI
import Firebase

struct DashboardView: View {
  @Binding var userIsSignedIn: Bool
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)

      VStack(spacing: 20) {
        Text("You have successfully signed in!")
          .foregroundColor(Color.white)
          .font(.title3)

        Button(action: {
          do {
            try Auth.auth().signOut()
            userIsSignedIn = false
          } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
          }
        }, label: {
          Text("Sign out".uppercased())
            .bold()
            .font(.title3)
        })
          .frame(height: 40)
          .padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
          .background(
            Color("ButtonBackgroundColor")
          )
          .foregroundColor(Color("ButtonTextColor"))
          .cornerRadius(Constants.General.buttonCornerRadius)
      }
    }
  }
}

struct DashboardView_Previews: PreviewProvider {
  @State static var userIsSignedIn = false
  
  static var previews: some View {
    DashboardView(userIsSignedIn: $userIsSignedIn)
  }
}
