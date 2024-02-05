//
//  ShowAppApp.swift
//  ShowApp
//
//  Created by Nikhil Vaddey on 1/18/24.
//

import SwiftUI
import Firebase

@main
struct SchoolMate1App: App {
    init() {
        FirebaseApp.configure()
        FirebaseConfiguration.shared.setLoggerLevel(.debug)
    }

    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
