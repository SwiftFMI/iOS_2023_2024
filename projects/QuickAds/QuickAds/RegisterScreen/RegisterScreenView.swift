//
//  RegisterScreenView.swift
//  QuickAds
//
//  Created by Emil Atanasov on 11/23/23.
//

import SwiftUI

struct RegisterScreenView: View {
    @State var username: String = ""
    @State var password: String = ""
    
    @ScaledMetric var labelWidth = 90
    @EnvironmentObject var mainViewModel: MainViewModel
    init() {
        print("Init RegisterScreenView")
    }
    
    var body: some View {
            let _ = print("RegisterScreenView.body")
            VStack {
                Text("Register")
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
                        Text("Register")
                    }
                    .buttonStyle(.bordered)
                    .disabled(username.isEmpty || password.isEmpty)
                }
                
                Spacer()
            }
            .padding()
            .onAppear(perform: {
                print("Invoke async code here...")
            })
            
    }
}

#Preview {
    RegisterScreenView()
}
