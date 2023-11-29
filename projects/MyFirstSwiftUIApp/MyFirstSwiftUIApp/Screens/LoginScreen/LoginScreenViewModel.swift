//
//  LoginScreenViewModel.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 11/16/23.
//

import Foundation
import Combine
//MVVM -> class -> weak, unowned

class LoginScreenViewModel: ObservableObject {
    @Published var isImageVisible = true
    @Published var isOverlayVisible = !true
    
    func login(username: String, password: String) -> Bool {
        print("Try to login using \(username)!")
        self.isOverlayVisible = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: { [weak self] in
            // code to execute
            self?.isOverlayVisible = !true
        })
        
        return true
    }
}
