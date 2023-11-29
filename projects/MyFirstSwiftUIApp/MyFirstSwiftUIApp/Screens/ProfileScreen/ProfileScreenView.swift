//
//  ProfileScreenView.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 11/16/23.
//

import SwiftUI

struct ProfileScreenView: View {
    @EnvironmentObject var homeScreenViewModel: HomeScreenViewModel
    
    var body: some View {
        VStack {
            Text("My Profile")
            
            Button {
                homeScreenViewModel.isLogged = false
            } label: {
                Text("Log out!")
            }

        }
    }
}

#Preview {
    ProfileScreenView()
}
