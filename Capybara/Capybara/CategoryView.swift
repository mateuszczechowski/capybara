//
//  CategoryView.swift
//  Capybara
//
//  Created by Mateusz Czechowski on 07/09/2023.
//

import SwiftUI

struct CategoryView: View {

    let index: Int

    @EnvironmentObject var votingForm: VotingForm
    @EnvironmentObject var repository: DatabaseRepository

    @Binding var tabSelection: Int

    var body: some View {

        VStack {

            Text(repository.categories[index].title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.largeTitle)
                .foregroundColor(.white)

            Spacer()
//            List(projectsBesideMine()) { project in
//                Text(project.name)
//            }

            Button("Next") {
                // Add safety and last check
                self.tabSelection = index + 1
            }
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(Color.brown)
    }

    func projectsBesideMine() -> [Project] {

        return repository.projects.filter { project in
            project != votingForm.selectedProject
        }
    }

}
