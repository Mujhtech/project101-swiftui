//
//  Project101App.swift
//  Project101
//
//  Created by Muhideen Mujeeb Adeoye on 13/07/2023.
//

import SwiftUI

@main
struct Project101App: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PeopleView().tabItem {
                    Symbols.person
                    Text("Home")
                }
            }
        }
    }
}
