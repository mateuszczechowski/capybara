//
//  StartVotingView.swift
//  Capybara
//
//  Created by Mateusz Czechowski on 07/09/2023.
//

import SwiftUI

struct StartVotingView: View {

    @State private var isVotingPopoverPresented: Bool = false

    @EnvironmentObject var repository: DatabaseRepository

    var body: some View {
        VStack {
            Button(action: {
                self.isVotingPopoverPresented = true
            }) {
                Text("VOTE")
                    .font(.largeTitle)
                    .frame(width: 260, height: 260)
                    .foregroundColor(Color.brown)
            }
            .background(Color.white)
            .clipShape(Circle())
            .fullScreenCover(isPresented: $isVotingPopoverPresented) {
                ProjectView(isPresented: $isVotingPopoverPresented).onAppear {
                    repository.reloadData()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.brown)
    }
}

struct StartVotingView_Previews: PreviewProvider {
    static var previews: some View {
        StartVotingView()
    }
}
