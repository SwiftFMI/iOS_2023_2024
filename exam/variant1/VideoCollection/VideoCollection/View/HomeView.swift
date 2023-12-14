//
//  ContentView.swift
//  VideoCollection
//
//  Created by Emil Atanasov on 12/13/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            List {
                Section("Колекци") {
                    Text("Природа")
                    Text("Колекция №1")
                    Text("Колекция №2")
                }
            }
            .listStyle(.plain)
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
