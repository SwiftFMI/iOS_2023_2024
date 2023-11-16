//
//  ContentView.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 10/09/23.
//

import SwiftUI


class MainScreenViewModel: ObservableObject {
    @Published var a = 1
    
    func increment() {
        a += 1
    }
}

struct MainScreenView: View {
//    @State var a = 1
    @ObservedObject var viewModel = MainScreenViewModel()
    
//    @State var items = ["Item 1", "Item 2", "Item 3"]
    
    func myText() -> String {
//        items.sor
        return "Hello Swift!"
    }
    
    var body: some View {
        let _ = print("\(#function)")
        if viewModel.a > 5 {
            Text(myText())
                .foregroundColor(.red)
        } else {
            VStack {
//                InputView(.username)
//                InputView(.password)
                Button {
                    print("Clicked")
                    viewModel.increment()
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
