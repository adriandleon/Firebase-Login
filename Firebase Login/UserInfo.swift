//
//  UserInfo.swift
//  Firebase Login
//
//  Created by Adrian De León on 8/10/22.
//

import Foundation

class UserInfo: ObservableObject {
    enum FBAuthState {
        case undefined, signedOut, signedIn
    }
    
    @Published
    var isUserAuthenticated: FBAuthState = .undefined
    
    @Published
    var name: String = "Adrian"
    
    func configureFirebaseStateDidChange() {
        self.isUserAuthenticated = .signedOut
    }
}
