//
//  ContentView.swift
//  AnimationsApp
//
//  Created by Emil Atanasov on 01/09/24.
//

import SwiftUI

struct ContentView: View {
    @State var size = 20.0
    @State var visibleAnimateButton = false
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.system(size: size))
                .onTapGesture {
                    withAnimation {
                        visibleAnimateButton = true
                    }
                }
            HStack {
                Spacer()
            }
            Spacer()
        }
            .overlay(alignment: .bottomTrailing) {
                if visibleAnimateButton {
                    Button {
                        withAnimation() {
                            size += 10
                        }
                    } label: {
                        Text("Animate")
                    }
                    .transition(.move(edge: .top))
                }

            }
    }
}

#Preview {
    ContentView()
}
