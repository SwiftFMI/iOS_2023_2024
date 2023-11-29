//
//  LoginScreenView.swift
//  QuickAds
//
//  Created by Emil Atanasov on 11/23/23.
//

import SwiftUI

struct LoginScreenView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @ScaledMetric var labelWidth = 90
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Login")
                    .font(.title3)
                HStack {
                    Text("Username:")
                        .frame(width: labelWidth, alignment: .leading)
                    TextField("username", text: $username)
                        .textFieldStyle(.roundedBorder)
                }
                HStack {
                    Text("Password:")
                        .frame(width: labelWidth, alignment: .leading)
                    SecureField("password", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
                
                HStack {
                    Spacer()
                    Button {
                        if username.isEmpty || password.isEmpty {
                            // show error
                            return
                        }
                        // todo log in
                        mainViewModel.login(username: username, password: password)
                    } label: {
                        Text("Login")
                    }
                    .buttonStyle(.bordered)
                    .disabled(username.isEmpty || password.isEmpty)
                }
                
                Spacer()
                
                NavigationLink {
                    RegisterScreenView()
                } label: {
                    Image(systemName: "person")
                    Text("Register")
                }

                
            }
            .padding()
        }
    }
}


#Preview("LeftToRight") {
    LoginScreenView()
        .environmentObject(MainViewModel())
        .environment(\.layoutDirection, LayoutDirection.leftToRight)
}

#Preview("RightToLeft") {
    LoginScreenView()
        .environmentObject(MainViewModel())
        .environment(\.layoutDirection, LayoutDirection.rightToLeft)
}


