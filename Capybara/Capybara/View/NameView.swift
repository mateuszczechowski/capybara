//
//  NameView.swift
//  Capybara
//
//  Created by Mateusz Czechowski on 08/09/2023.
//

import SwiftUI

struct NameView: View {

    @AppStorage("username") var username: String = ""
    @EnvironmentObject var repository: DatabaseRepository

    var body: some View {
        VStack {
            TextField("Enter your name", text: $username)
            .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(24)
        .background(.brown)
    }
}

