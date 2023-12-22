//
//  ContentView.swift
//  Persistance
//
//  Created by Emil Atanasov on 12/19/23.
//

import SwiftUI


let LOCATION_KEY = "my.app.location.key"
let SERVICE_ID = "my.app.keychain"

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    @AppStorage(LOCATION_KEY) var location: String?
    
   
    var body: some View {
        VStack {
            if let username = viewModel.username {
                Text("Hello, \(username)!")
                if let myLocation = location {
                    Text("My location is \(myLocation)!")
                }
                Button(action: {
                    viewModel.logout()
                }, label: {
                    Text("Logout")
                })
                if location != nil {
                    Button {
                        location = nil
                    }
                    label: {
                        Text("Remove location")
                    }
                } else {
                    Button {
                        location = "BG"
                    }
                    label: {
                        Text("Set location")
                    }
                }
                
                
                
            } else {
                Button { 
                    viewModel.store(username: "Ivo", password: "myPass!100")
                }
                label: {
                    Text("Login as Ivo")
                }
            }
        }
        .padding()
        .task {
            viewModel.load()
            viewModel.loadData()
        }
    }
}

#Preview {
    ContentView()
}
