//
//  VotingView.swift
//  Capybara
//
//  Created by Mateusz Czechowski on 08/09/2023.
//

import SwiftUI

struct VotingView: View {

    let votingForm: VotingForm
    @Binding var isPresented: Bool
    @EnvironmentObject var repository: DatabaseRepository
    @State var selection: Int = 0
    var body: some View {

        NavigationStack {
            TabView(selection: $selection) {
                ForEach(0..<5) { index in
                    CategoryView(index: index, tabSelection: $selection).tag(index)
                }
            }
            .environmentObject(votingForm)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .toolbarBackground(.clear, for: .navigationBar)
            .toolbar {
                Button {
                    self.isPresented = false
                } label: {
                    Image(systemName: "xmark").padding(10).foregroundColor(.mahogany)
                }
            }
        }
        .tint(.white)
//        .navigationBarTitleDisplayMode(.inline)
        .background(Color.brown)
    }
}

struct VotingView_Previews: PreviewProvider {

    @State static var isPresented = true

    static var previews: some View {
        VotingView(
            votingForm: VotingForm(selectedProject: Project(id: 0, name: "test")),
            isPresented: $isPresented
        )
    }
}
