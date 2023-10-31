//
//  InputView.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 10/26/23.
//

import SwiftUI

enum InputViewType {
    case password
    case username
    case email
}

struct InputView: View {
    var label: String = "Input:"
    var prompt: String = "your value"
    var isSecure = false
    @State private var value: String = ""
    
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
            Button {
                print("Value: \(value)")
            } label: {
                Text("Debug")
            }

        }
    }
}

#Preview {
    InputView(.password)
}
