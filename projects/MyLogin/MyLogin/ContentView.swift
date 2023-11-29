//
//  ContentView.swift
//  MyLogin
//
//  Created by Emil Atanasov on 11/21/23.
//

import SwiftUI

@Observable
class MyData {
    var name: String = "Demo"
    var age: Int = 10
}

@Observable
class Storage {
    var name: String = "Demo"
    var id: Int = 10
}


class StorageOld: ObservableObject {
    @Published var name: String = "Demo"
    @Published var id: Int = 10
}



struct ContentView: View {
    
//    @State var buttonText = "Debug"
    var data = MyData()
    var storage = Storage()
    @StateObject var storageOld = StorageOld()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button {
//                buttonText += "^"
                data.name += "*"
            } label: {
                Text(data.name)
            }
            .buttonStyle(.borderedProminent)
            
            EditorView(data: data)
                .environment(storage)
                .environmentObject(storageOld)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
