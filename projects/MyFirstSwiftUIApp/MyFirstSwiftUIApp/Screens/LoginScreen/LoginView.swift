//
//  LoginView.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 11/16/23.
//

import SwiftUI

struct LoginView: View {
    var action: (String, String) -> ()
    @State var username: String = ""
    @State var password: String = ""
    
    @EnvironmentObject var homeScreenViewModel: HomeScreenViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            InputView(.username, value: $username)
//            HStack {
//                Text("Username:")
//                TextField(prompt, text: $username)
//                    .textFieldStyle(.roundedBorder)
//            }
            InputView(.password, value: $password)
            HStack {
                Text("Debug: \(username)")
            }
            Button {
                action(username, password)
                homeScreenViewModel.isLogged = true
            } label: {
                Text("Login")
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    LoginView(action: { username, password in
        print("Username: \(username)")
    })
    .environmentObject(HomeScreenViewModel())
}
