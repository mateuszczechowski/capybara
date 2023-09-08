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
            StartVotingView()
                .tabItem {
                    Label("Vote", image: "Vote")
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
        }
        .tint(.mahogany)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
