//
//  MainViewModel.swift
//  QuickAds
//
//  Created by Emil Atanasov on 11/23/23.
//

import Foundation


class MainViewModel: ObservableObject {
    @Published var isLogged = false
    
    func login(username: String, password: String) {
        self.isLogged = true
    }
}
