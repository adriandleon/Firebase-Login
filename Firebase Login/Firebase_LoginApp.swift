//
//  Firebase_LoginApp.swift
//  Firebase Login
//
//  Created by Adrian De León on 8/10/22.
//

import SwiftUI

@main
struct Firebase_LoginApp: App {
    
    @StateObject var userInfo = UserInfo()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(userInfo)
        }
    }
}
