//
//  ProjectView.swift
//  Capybara
//
//  Created by Пазин Даниил on 07/09/2023.
//

import SwiftUI

struct ProjectView: View {
    var body: some View {

        NavigationStack {
            List {
                Text("Some project should be here.")
                Text("Some another project should be here.")
            }
            .toolbar {
                Button {
                    print("Adding project logic.")
                } label: {
                    Image(systemName: "plus")
                }

            }
        }

//        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct PizzaView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
