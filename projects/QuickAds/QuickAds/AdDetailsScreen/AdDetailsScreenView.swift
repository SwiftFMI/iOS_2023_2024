//
//  AdDetailsScreenView.swift
//  QuickAds
//
//  Created by Emil Atanasov on 11/28/23.
//

import SwiftUI

struct AdDetailsScreenView: View {
    var ad: Ad
    @State var buttonScreen = false
    @EnvironmentObject var homeScreenViewModel: HomeScreenViewModel
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: ad.image)
                    .font(.system(size: 150))
                Text(ad.title)
                    .font(.title)
                Text(ad.description)
                Spacer()
                
                Button {
                    print("Hello")
//                    buttonScreen.toggle()
                    homeScreenViewModel.goToHome()
                } label: {
                    Text("Home")
                }
                .buttonStyle(.bordered)
                
//                NavigationLink(
//                    destination: InnerScreenView(),
//                    isActive: $buttonScreen,
//                    label: {
//                    })
                NavigationLink(value: Ad.mock) {
                    Text("Mock Ad")
                }
            }
            .padding()
        }
    }
}

#Preview {
    NavigationView {
        AdDetailsScreenView(ad: Ad.mock)
    }
}
