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
            TabView {
                CategoryView()
                CategoryView()
                CategoryView()
                CategoryView()
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .toolbarBackground(.clear, for: .navigationBar)
            .toolbar {
                Button {
                    print("Adding project logic.")
                    
                    self.isPresented = false
                } label: {
                    Text("Close")
                }
            }
        }
//        NavigationStack {
//            Text("Category name")
//        }

//        .navigationBarTitleDisplayMode(.automatic)
    }
}
