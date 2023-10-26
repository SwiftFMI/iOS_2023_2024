//
//  ContentView.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 10/09/23.
//

import SwiftUI
import Photos

struct MainScreenView: View {
    var body: some View {
        VStack {
//            let _ = print("demo")
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Image(systemName: "square.and.arrow.up.trianglebadge.exclamationmark")
                .foregroundColor(Color.orange)
                
            Text("Hello, swift!")
                .foregroundColor(.red)
                .background(Color.blue)
            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
            Button {
                print("hello!")
            } label: {
                Text("Hi")
            }
            .buttonStyle(.bordered)
            .tint(.green)

        }
        .padding()
    }
}

#Preview {
    MainScreenView()
//    Text("Hello")
}
