//
//  LoginView.swift
//  Firebase Login
//
//  Created by Adrian De León on 8/10/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        Button("Login") {
            self.userInfo.isUserAuthenticated = .signedIn
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
