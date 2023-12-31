//
//  DatabaseRepository.swift
//  Capybara
//
//  Created by Mateusz Czechowski on 07/09/2023.
//

import Foundation
import FirebaseDatabase
import SwiftUI

class DatabaseRepository: ObservableObject {

    var categories: [Category] = []
    var projects: [Project] = []
    var highscore = 0
    var highscoreName: String = ""
    var speedMultipier: Double = 0.025
    var minimumLevel: Int = 0
    @AppStorage("username") var username: String = ""

    private let ref = Database
        .database(url: "https://capybara-d1f5f-default-rtdb.europe-west1.firebasedatabase.app")
        .reference()

    init() {
        observeHighscore()
        observeHighscoreName()
        observeLevelDivider()
        observeSpeedMultiplier()
    }

    func updateHighscore(score: Int) {
        ref.updateChildValues(["highscore": score, "highscoreName": username])
    }

    func observeLevelDivider() {
        ref.child("levelDivider").observe(.value) { snapshot in
            guard let level = snapshot.value as? Int else {
                return
            }

            self.minimumLevel = level
        }
    }

    func observeSpeedMultiplier() {
        ref.child("speedMultiplier").observe(.value) { snapshot in
            guard let speed = snapshot.value as? Double else {
                return
            }

            self.speedMultipier = speed
        }
    }

    func observeHighscoreName() {
        ref.child("highscoreName").observe(.value) { snapshot in
            guard let hsName = snapshot.value as? String else {
                return
            }

            self.highscoreName = hsName
        }
    }

    func observeHighscore() {
        ref.child("highscore").observe(.value) { snapshot in
            guard let hs = snapshot.value as? Int else {
                return
            }
            
            self.highscore = hs
        }
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
