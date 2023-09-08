//
//  Category.swift
//  Capybara
//
//  Created by Mateusz Czechowski on 08/09/2023.
//

import Foundation

class Category: Codable {
    let title: String

    init(title: String) {
        self.title = title
    }

    convenience init?(dictionary: [String : Any]) {
        guard let title = dictionary["title"] as? String else { return nil }

        self.init(title: title)
    }
}
