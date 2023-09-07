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
                    Label("Vote", systemImage: "checkmark.bubble.fill")
                }
            GameView()
                .tabItem {
                    Label("Capybara", image: "")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
