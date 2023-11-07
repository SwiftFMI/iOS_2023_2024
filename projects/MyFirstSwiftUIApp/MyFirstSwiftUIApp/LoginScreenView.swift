//
//  LoginScreenView.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 11/02/23.
//

import SwiftUI

struct LoginScreenView: View {
    @State var isImageVisible = true
    @State var isOverlayVisible = !true
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            if isImageVisible {
                Image(.sampleAppsHero)
                    .resizable()
                    .frame(height: 100)
                    .scaledToFit()
            }
                
//                .aspectRatio(contentMode: .fit)
                
            Text("Some text goes here")
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            LoginView {
//                isImageVisible.toggle()
                isOverlayVisible = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    // code to execute
                    isOverlayVisible = !true
                })
            }
            Spacer()
                .frame(height: 50)
            Text("Forget Password")
                
            Spacer()
            
            Text("Don't have account! Join")
            
        }
        .padding()
        .foregroundColor(.black)
        .overlay {
            if isOverlayVisible {
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

struct LoginView: View {
    var action: () -> ()
    var body: some View {
        VStack(alignment: .leading) {
            InputView(.username)
            InputView(.password)
            Button {
                print("Login now!")
                action()
            } label: {
                Text("Login")
            }
            .buttonStyle(.bordered)

        }
        
    }
}
