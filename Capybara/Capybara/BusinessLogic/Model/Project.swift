//
//  Project.swift
//  Capybara
//
//  Created by Mateusz Czechowski on 08/09/2023.
//

import Foundation

class Project: Codable, Identifiable, Equatable {
    static func == (lhs: Project, rhs: Project) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }

    let id: Int
    let name: String

    init(id: Int, name: String) {
        self.name = name
        self.id = id
    }

    convenience init?(dictionary: [String : Any]) {
        guard let name = dictionary["name"] as? String,
              let id = dictionary["id"] as? Int else {
            return nil
        }

        self.init(id: id, name: name)
    }
}
