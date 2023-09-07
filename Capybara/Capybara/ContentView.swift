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
            ProjectView()
                .tabItem {
                    Label("Vote", image: "Vote")
                }
            GameView()
                .tabItem {
                    Label("Capybara", image: "Capybara")
                }
        }
        .tint(.brown)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
