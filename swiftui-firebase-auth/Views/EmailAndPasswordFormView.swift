//
//  EmailAndPasswordFormView.swift
//  swiftui-firebase-auth
//
//  Created by Damien K. Sedgwick on 03/11/2021.
//

import SwiftUI
import Firebase

struct EmailAndPasswordFormView: View {
  @Binding var emailAddress: String
  @Binding var password: String
  @Binding var userIsSignedIn: Bool

  @State private var createNewAccount: Bool = false

  var body: some View {

    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)

      VStack(spacing: 20) {
        TextField("Emaill address", text: $emailAddress)
          .frame(height: Constants.General.textInputHeight)
          .frame(maxWidth: Constants.General.textInputMaxWidth)
          .textInputAutocapitalization(.never)
          .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
          .foregroundColor(Color("TextFieldTextColor"))
          .background(
            Color("TextInputBackgroundColor")
          )
          .cornerRadius(Constants.General.textInputCornerRadius)

        SecureField("Password", text: $password)
          .frame(height: Constants.General.textInputHeight)
          .frame(maxWidth: Constants.General.textInputMaxWidth)
          .textInputAutocapitalization(.never)
          .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
          .foregroundColor(Color("TextFieldTextColor"))
          .background(
            Color("TextInputBackgroundColor")
          )
          .cornerRadius(Constants.General.textInputCornerRadius)

        HStack {
          Toggle(isOn: $createNewAccount) {
            Text("Create new account?")
              .foregroundColor(Color.white)
          }
        }
        .frame(maxWidth: Constants.General.textInputMaxWidth)


        Button(action: {
          if (createNewAccount) {
            Auth.auth().createUser(withEmail: emailAddress, password: password)  { (result, error) in
              if error != nil {
                print(error?.localizedDescription ?? "")
              } else {
                userIsSignedIn = true
              }
            }
          } else {
          Auth.auth().signIn(withEmail: emailAddress, password: password) { (result, error) in
            if error != nil {
              print(error?.localizedDescription ?? "")
            } else {
              userIsSignedIn = true
            }
          }
          }
        }, label: {
          Text(createNewAccount ? "Create".uppercased() : "Sign in".uppercased())
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

struct EmailAndPasswordFormView_Previews: PreviewProvider {
  @State static var emailAddress = "damiensedgwick@icloud.com"
  @State static var password = "Password1234"
  @State static var userIsSignedIn = false

  static var previews: some View {
    EmailAndPasswordFormView(emailAddress: $emailAddress, password: $password, userIsSignedIn: $userIsSignedIn)
  }
}
