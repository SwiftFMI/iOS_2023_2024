//
//  HomeScreenView.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 11/16/23.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject var viewModel = HomeScreenViewModel()
    @AppStorage("logins") var numberOfLogins = 0
    
    
    var body: some View {
        if viewModel.isLogged {
            ProfileScreenView()
            .environmentObject(viewModel)
        } else {
            LoginScreenView()
            .environmentObject(viewModel)
        }
    }
}


#Preview {
    HomeScreenView()
}
