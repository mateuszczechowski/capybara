//
//  ContentView.swift
//  Capybara
//
//  Created by Пазин Даниил on 07/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NameView()
                .tabItem {
                    Label("Me", image: "Vote")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.white, for: .tabBar)
                .environmentObject(DatabaseRepository())
            GameView()
                .tabItem {
                    Label("Capybara", image: "Capybara")
                }
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarBackground(.white, for: .tabBar)
                .environmentObject(DatabaseRepository())
        }
        .tint(.mahogany)
        .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
