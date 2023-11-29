//
//  LoginScreenView.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 11/02/23.
//

import SwiftUI

struct LoginScreenView: View {
    @ObservedObject var viewModel = LoginScreenViewModel()
    @State var myState = "Debug"
    
    @AppStorage("logins") var numberOfLogins = 0
    
    
//    @EnvironmentObject var homeScreenViewModel: HomeScreenViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            if viewModel.isImageVisible {
                Image(.sampleAppsHero)
                    .resizable()
                    .frame(height: 100)
                    .scaledToFit()
            }
            Button {
                myState += "+"
            } label: {
                Text(myState)
            }
            .buttonStyle(.bordered)

            Text("Some text goes here")
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center) 
            LoginView { (username, password) in
//                if viewModel.login(username: username, password: password) {
//                    homeScreenViewModel.isLogged = true
//                }
                print("Old value: \(numberOfLogins)")
                numberOfLogins += 1
            }
//            .environmentObject(HomeScreenViewModel())
            Spacer()
                .frame(height: 50)
            Text("Forget Password")
                
            Spacer()
            
            Text("Don't have account! Join")
            
        }
        .padding()
        .foregroundColor(.black)
        .overlay {
            if viewModel.isOverlayVisible {
                VStack {
                    Spacer()
                    HStack() {
                        ProgressView()
                            .padding(.trailing, 10)
                        Text("Loading...")
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(Color.blue)
            }
        }
    }
}

#Preview {
    LoginScreenView()
}


