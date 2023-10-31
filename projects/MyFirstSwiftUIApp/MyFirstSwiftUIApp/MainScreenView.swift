//
//  ContentView.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 10/09/23.
//

import SwiftUI

struct MainScreenView: View {
    @State var a = 1
    
    func myText() -> String {
        "Hello Swift!"
    }
    
    var body: some View {
        let _ = print("\(#function)")
        if a > 5 {
            Text(myText())
                .foregroundColor(.red)
        } else {
            VStack {
//                InputView(.username)
//                InputView(.password)
                Button {
                    print("Clicked")
                    a += 1
                } label: {
                    Text("Button")
//                        .background(Color.gray)
//                        .foregroundColor(.red)
                }
//                .padding()
//                .background(Color.gray)
                .buttonStyle(.bordered)
//                .cornerRadius(5.0)
                
            }
            .padding()
            
        }
    }
}

#Preview {
    MainScreenView()
//    Text("Hello")
}
