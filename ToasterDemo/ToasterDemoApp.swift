//
//  ToasterDemoApp.swift
//  ToasterDemo
//
//  Created by Itsuki on 2025/03/22.
//

import SwiftUI
import Toaster

@main
struct ToasterDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .provideToaster(animationDisabled: false)
        }
    }
}
