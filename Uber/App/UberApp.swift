//
//  UberApp.swift
//  Uber
//
//  Created by Ilya Schevchenko on 08.09.2024.
//

import SwiftUI

@main
struct UberApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
