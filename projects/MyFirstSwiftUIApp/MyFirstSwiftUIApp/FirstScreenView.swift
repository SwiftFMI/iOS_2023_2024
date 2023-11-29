//
//  FirstScreenView.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 10/31/23.
//

import SwiftUI

struct FirstScreenView: View {
    @State var a = 0
    
    func demo() {
        var m: MySingleton = MySingleton.instance
        
    }
    
    var body: some View {
        let _ = print("SwiftUI executes our component body.")
        if a > 3 {
            MyInputView(.username)
            MyInputView(.password)
        } else {
            Button {
                print("a = \(a)")
                a += 1
            } label: {
                Text("Hello")
            }
//            .padding()
            .padding(.trailing, 10)
            .buttonStyle(.bordered)
        }
    }
}


struct MyInputView: View {
    var label: String
    var isSecure = false
    var prompt = "prompt"
    @State var value = ""
    
    init(_ type: InputViewType) {
        switch type {
        case .password:
            self.label = "Password:"
            self.prompt = "your password"
            self.isSecure = true
        case .username:
            self.label = "Username:"
            self.prompt = "username"
            self.isSecure = false
        case .email:
            self.label = "Email:"
            self.prompt = "your@email.com"
            self.isSecure = false
        }
        
        self.value = ""
    }
    
    
    var body: some View {
        HStack {
            Text(label)
            if !isSecure {
                TextField(prompt, text: $value)
                    .textFieldStyle(.roundedBorder)
            } else {
                SecureField(prompt, text: $value)
                    .textFieldStyle(.roundedBorder)
            }
            
        }
    }
}


#Preview {
    FirstScreenView()
//    MyInputView()
}
