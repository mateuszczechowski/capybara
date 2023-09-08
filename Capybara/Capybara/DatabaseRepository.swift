//
//  DatabaseRepository.swift
//  Capybara
//
//  Created by Mateusz Czechowski on 07/09/2023.
//

import Foundation
import FirebaseDatabase
import CodableFirebase

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

class DatabaseRepository {

    var categories: [Category] = []

    private let ref = Database
        .database(url: "https://capybara-d1f5f-default-rtdb.europe-west1.firebasedatabase.app")
        .reference()

    init() {
        reloadCategories()
    }

    func reloadCategories() {

        ref.getData(completion:  { [weak self] error, snapshot in
            guard error == nil, let snapshot else {
                print(error!.localizedDescription)
                return
            }

            let firstDict = snapshot.value as? [String: Any]
            var categories: [Category] = []
            for i in firstDict?["categories"] as! [[String: Any]] {
                guard let category = Category(dictionary: i) else {
                    return
                }
                categories.append(category)
            }

            self?.categories = categories
        })

    }
}
