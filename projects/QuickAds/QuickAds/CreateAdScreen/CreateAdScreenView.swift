//
//  CreateAdView.swift
//  QuickAds
//
//  Created by Emil Atanasov on 11/23/23.
//

import SwiftUI

struct CreateAdScreenView: View {
    @State var title: String
    @State var description: String
    
    var callback: (Ad) -> Void
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Image(systemName: "plus.circle")
                .font(.system(size: 150))
            TextField("Ad title", text: $title)
            TextEditor(text: $description)
            Spacer()
            Button {
                callback(Ad(image: "plus.circle", title: title, id: 1001))
                dismiss()
            } label: {
                Text("Create Ad")
            }
            .buttonStyle(.bordered)

        }
        .padding()
    }
}

#Preview {
    CreateAdScreenView(title: "Test title", description: "A lot more text goes here") { ad in
        print("ready")
    }
}
