//
//  ProjectView.swift
//  Capybara
//
//  Created by Пазин Даниил on 07/09/2023.
//

import SwiftUI
import FirebaseDatabase

struct ProjectView: View {

    @Binding var isPresented: Bool
    @EnvironmentObject var repository: DatabaseRepository

    var body: some View {

        NavigationStack {

            VStack {

                Text("Select your project")
                    .font(.largeTitle)
                    .foregroundColor(.white)

                List(repository.projects) { project in

                    NavigationLink {
//                        VotingView(
//                            votingForm: VotingForm(selectedProject: project),
//                            isPresented: $isPresented
//                        )
                    } label: {
                        Text(project.name)
                    }
                    .tint(.brown)
                    .foregroundColor(.brown)
                    .font(.title3)
                }
                .background(.brown)
                .scrollContentBackground(.hidden)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .toolbarBackground(.clear, for: .navigationBar)
                .toolbar {
                    Button {
                        self.isPresented = false
                    } label: {
                        Image(systemName: "xmark").padding(10).foregroundColor(.white)
                    }
                }

            }
            .background(.brown)
        }
    }
}

struct ProjectView_Previews: PreviewProvider {

    @State static var isPresented = true

    static var previews: some View {
        ProjectView(isPresented: $isPresented)
    }
}
