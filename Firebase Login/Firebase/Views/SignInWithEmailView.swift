//
//  SignInWithEmailView.swift
//  Firebase Login
//
//  Created by Adrian De León on 18/10/22.
//

import SwiftUI

struct SignInWithEmailView: View {
    @EnvironmentObject var userInfo: UserInfo
    @State var user: UserViewModel = UserViewModel()
    @Binding var showSheet: Bool
    @Binding var action: LoginView.Action?
    
    var body: some View {
        VStack {
            TextField("Email Address", text: self.$user.email)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            SecureField("Password", text: $user.password)
            HStack {
                Spacer()
                Button(action: {
                    self.action = .resetPassword
                    self.showSheet = true
                }) {
                    Text("Forgot Password")
                }
            }.padding(.bottom)
            VStack(spacing: 10) {
                Button {
                    // SignIn Action
                } label: {
                    Text("Login")
                        .padding(.vertical, 15)
                        .frame(width: 200)
                        .background(.green)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                        .opacity(user.isLoginComplete ? 1 : 0.75)
                }.disabled(!user.isLoginComplete)
                
                Button {
                    // SignUp Action
                    self.action = .signUp
                    self.showSheet = true
                } label: {
                    Text("Sign Up")
                        .padding(.vertical, 15)
                        .frame(width: 200)
                        .background(.blue)
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
            }
        }.padding(.top)
            .frame(width: 300)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

