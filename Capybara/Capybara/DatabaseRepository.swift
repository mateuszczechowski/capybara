//
//  DatabaseRepository.swift
//  Capybara
//
//  Created by Mateusz Czechowski on 07/09/2023.
//

import Foundation
import FirebaseDatabase

struct Category {
    let title: String

    init(title: String) {
        self.title = title
    }

    init?(dictionary: [String : Any]) {
        guard let title = dictionary["title"] as? String else { return nil }

        self.init(title: title)
    }
}

class DatabaseRepository {
    let ref = Database.database(url: "https://capybara-d1f5f-default-rtdb.europe-west1.firebasedatabase.app").reference()

    init() {
//        getData()
        categories()
    }

    func categories() -> [Category] {
        ref.getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return;
            }
            for ele in snapshot!.children {
                if let snap = ele as? DataSnapshot {
                    guard let json = snapshot?.value as? [String: Any] else {
                        return
                    }
                    print("@@@ TEST: ", Category(dictionary: json))
                }
            }
//            let dict = snapshot?.value as? [String: Any]
//            let array = dict?["categories"] as? [Any]
//            print("@@@ TEST: ", array)
//            print("@@@ CAT:", Category(dictionary: title["categories"] as? [String: Any]))
        })

        return []
    }

    func getData() {
        ref.child("categories").getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return;
            }
            let test = snapshot?.value
            print("@@@ TEST: ", test)
        })
    }
}
