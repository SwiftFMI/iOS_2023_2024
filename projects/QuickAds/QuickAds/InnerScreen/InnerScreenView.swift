//
//  InnerScreenView.swift
//  QuickAds
//
//  Created by Emil Atanasov on 11/28/23.
//

import SwiftUI

struct InnerScreenView: View {
    @EnvironmentObject var homeScreenViewModel: HomeScreenViewModel
    
    var body: some View {
        Button {
            print("path: \(homeScreenViewModel.path)")
            print("go to home screen")
            
        } label: {
            Image(systemName: "house.fill")
                .foregroundColor(.green)
        }

    }
}

#Preview {
    InnerScreenView()
        .environmentObject(HomeScreenViewModel())
}
