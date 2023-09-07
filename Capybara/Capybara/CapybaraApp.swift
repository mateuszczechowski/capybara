//
//  CapybaraApp.swift
//  Capybara
//
//  Created by Пазин Даниил on 07/09/2023.
//

import SwiftUI

@main
struct CapybaraApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var motionDataManager = MotionDataManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(motionDataManager)
        }
    }
}
