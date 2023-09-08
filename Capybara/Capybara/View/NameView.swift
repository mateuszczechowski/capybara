//
//  NameView.swift
//  Capybara
//
//  Created by Mateusz Czechowski on 08/09/2023.
//

import SwiftUI

struct NameView: View {

    @State var name: String = ""
    @EnvironmentObject var repository: DatabaseRepository

    var body: some View {
        VStack {
            TextField("Enter your name", text: $name) { _ in
                self.repository.name = name
            }
            .multilineTextAlignment(.center)
            .tint(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(24)
        .background(.brown)
    }
}

