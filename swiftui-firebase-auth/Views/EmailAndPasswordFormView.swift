//
//  EmailAndPasswordFormView.swift
//  swiftui-firebase-auth
//
//  Created by Damien K. Sedgwick on 03/11/2021.
//

import SwiftUI

struct EmailAndPasswordFormView: View {
  @Binding var emailAddress: String
  //  @FocusState private var emailAddressFieldIsFocused: Bool = false

  @Binding var password: String
  //  @FocusState private var passwordFieldIsFocused: Bool = false

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

        TextField("Password", text: $password)
          .frame(height: Constants.General.textInputHeight)
          .frame(maxWidth: Constants.General.textInputMaxWidth)
          .textInputAutocapitalization(.never)
          .padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6))
          .foregroundColor(Color("TextFieldTextColor"))
          .background(
            Color("TextInputBackgroundColor")
          )
          .cornerRadius(Constants.General.textInputCornerRadius)

        Button(action: {}, label: {
          Text("Submit".uppercased())
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

  static var previews: some View {
    EmailAndPasswordFormView(emailAddress: $emailAddress, password: $password)
  }
}
