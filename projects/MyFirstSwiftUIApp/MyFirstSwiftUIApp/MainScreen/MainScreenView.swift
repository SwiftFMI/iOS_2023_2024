//
//  ContentView.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 10/09/23.
//

import SwiftUI


struct MainScreenView: View {
//    @State var a = 1
    @ObservedObject var viewModel = MainScreenViewModel()
    
//    @State var items = ["Item 1", "Item 2", "Item 3"]
    @State var items = [Car(name: "Item 1"),
                        Car(name: "Item 2"),
                        Car(name: "Item 3")]
    
    func myText() -> String {
//        items.sor
//        var kp = \MainScreenViewModel.car?.name
//        var kpName = \Car.name
//        var combined = kp.appending(path: kpName)
//        viewModel[keyPath: kp] = "hello"
//        viewModel.a
//        items.map(\.name)
        return "Hello Swift!"
    }
    
    var body: some View {
        let _ = print("\(#function)")
        if viewModel.a > 5 {
            myTextView
        } else {
            VStack {
//                InputView(.username)
//                InputView(.password)
                
                TextField("username", text: $viewModel.username)
                    .textFieldStyle(.roundedBorder)
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
    
    var myTextView: some View {
        Text(myText())
            .foregroundColor(.red)
    }
}

#Preview {
    MainScreenView()
//    Text("Hello")
}
