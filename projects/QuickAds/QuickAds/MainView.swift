//
//  ContentView.swift
//  QuickAds
//
//  Created by Emil Atanasov on 11/23/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isLogged {
            HomeScreenView()
                .environmentObject(viewModel)
        } else {
            LoginScreenView()
                .environmentObject(viewModel)
        }
    }
}

#Preview {
    MainView()
}
