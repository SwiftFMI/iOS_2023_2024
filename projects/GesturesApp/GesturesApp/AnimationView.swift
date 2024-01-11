//
//  AnimationView.swift
//  GesturesApp
//
//  Created by Emil Atanasov on 01/09/24.
//

import SwiftUI

struct AnimationView: View {
    
    @State var size = 27.0
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.system(size: size))
            //            .onTapGesture {
            //                withAnimation {
            //                    size + 30
            //                }
            //            }
            HStack {
                Spacer()
            }
            Spacer()
        }
            .overlay(alignment: .bottomTrailing) {
                Button {
                    withAnimation() { 
                        size += 30
                    }
                } label: {
                    Text("Animate")
                }

            }
    }
}

#Preview {
    AnimationView()
}
