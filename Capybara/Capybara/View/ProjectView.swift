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
    
    var body: some View {

        NavigationStack {
            List {
                Text("Some project should be here.")
                Text("Some another project should be here.")
            }
            .toolbar {
                Button {
                    print("Adding project logic.")
                    let ref = Database.database(url: "https://capybara-d1f5f-default-rtdb.europe-west1.firebasedatabase.app").reference()
                    ref.child("category").getData(completion:  { error, snapshot in
                        guard error == nil else {
                            print(error!.localizedDescription)
                            return;
                        }
                        let test = snapshot?.value
                        print("@@@ TEST: ", test)
                    })
                    self.isPresented = false
                } label: {
                    Image(systemName: "plus")
                }

            }
        }

//        .navigationBarTitleDisplayMode(.automatic)
    }
}
