//
//  VotingForm.swift
//  Capybara
//
//  Created by Mateusz Czechowski on 08/09/2023.
//

import Foundation

class VotingForm: ObservableObject {
    let selectedProject: Project

    init(selectedProject: Project) {
        self.selectedProject = selectedProject
    }
}
