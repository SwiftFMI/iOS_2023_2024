//
//  HomeScreenView.swift
//  QuickAds
//
//  Created by Emil Atanasov on 11/23/23.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject var viewModel = HomeScreenViewModel()
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            List {
                ForEach(viewModel.ads, id: \.id) { ad in
//                    NavigationLink {
//                        AdDetailsScreenView(ad: ad)
//                            .environmentObject(viewModel)
//                    } label: {
//                        HStack {
//                            Image(systemName: ad.image)
//                                .font(.largeTitle)
//                                .frame(width: 30)
//                            Text(ad.title)
//                                .padding(.leading, 10)
//                        }
//                    }
                    
                    NavigationLink(value: ad) {
                        HStack {
                            Image(systemName: ad.image)
                                .font(.largeTitle)
                                .frame(width: 30)
                            Text(ad.title)
                                .padding(.leading, 10)
                        }
                    }
                    
                }
                .onDelete(perform: { indexSet in
                    viewModel.removeAd(indexSet: indexSet)
                })
                
            }
            .navigationDestination(for: Ad.self, destination: { ad in
                AdDetailsScreenView(ad: ad)                            .environmentObject(viewModel)
            })
            
            
            .listStyle(PlainListStyle())
            .navigationTitle("Ads")
//            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink {
                    CreateAdScreenView(title: "Нова обява", description: "Описание на обявата") { ad in
                        viewModel.add(ad: ad)
                    }
                } label: {
                    Image(systemName: "plus.circle")
                }

            }
            .onAppear {
                viewModel.loadAllAds()
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
