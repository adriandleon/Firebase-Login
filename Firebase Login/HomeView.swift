//
//  HomeView.swift
//  Firebase Login
//
//  Created by Adrian De León on 8/10/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userInfo: UserInfo
    
    var body: some View {
        NavigationView {
            Text("Logged in as user")
                .navigationTitle("Firebase Login")
                .navigationBarItems(trailing: Button("Log Out") {
                    self.userInfo.isUserAuthenticated = .signedOut
                })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
