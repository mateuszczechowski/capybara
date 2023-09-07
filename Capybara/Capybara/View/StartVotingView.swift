//
//  StartVotingView.swift
//  Capybara
//
//  Created by Mateusz Czechowski on 07/09/2023.
//

import SwiftUI

struct StartVotingView: View {

    @State private var isVotingPopoverPresented: Bool = false

    let repository: DatabaseRepository

    var body: some View {
        
        Button(action: {
            self.isVotingPopoverPresented = true
        }) {
            Text("VOTE")
                .font(.largeTitle)
                .frame(width: 260, height: 260)
                .foregroundColor(Color.white)
        }
        .background(Color.red)
        .clipShape(Circle())
        .fullScreenCover(isPresented: $isVotingPopoverPresented) {
            ProjectView(isPresented: $isVotingPopoverPresented)
        }
    }
}

struct StartVotingView_Previews: PreviewProvider {
    static var previews: some View {
        StartVotingView(repository: DatabaseRepository())
    }
}
