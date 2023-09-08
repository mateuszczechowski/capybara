//
//  DatabaseRepository.swift
//  Capybara
//
//  Created by Mateusz Czechowski on 07/09/2023.
//

import Foundation
import FirebaseDatabase

class DatabaseRepository: ObservableObject {

    var categories: [Category] = []
    var projects: [Project] = []

    private let ref = Database
        .database(url: "https://capybara-d1f5f-default-rtdb.europe-west1.firebasedatabase.app")
        .reference()

    init() {
        reloadData()
    }

    func reloadData() {

        ref.getData(completion:  { [weak self] error, snapshot in
            guard error == nil, let snapshot else {
                print(error!.localizedDescription)
                return
            }

            guard let firstDict = snapshot.value as? [String: Any] else {
                return
            }

            self?.dispatchCategories(from: firstDict)
            self?.dispatchProjects(from: firstDict)
        })
    }

    private func dispatchCategories(from dictionary: [String: Any]) {
        var categories: [Category] = []
        
        for i in dictionary["categories"] as! [[String: Any]] {
            guard let category = Category(dictionary: i) else {
                return
            }
            categories.append(category)
        }

        self.categories = categories
    }

    private func dispatchProjects(from dictionary: [String: Any]) {
        var projects: [Project] = []

        for i in dictionary["projects"] as! [[String: Any]] {
            guard let project = Project(dictionary: i) else {
                return
            }

            projects.append(project)
        }

        self.projects = projects
    }

}
