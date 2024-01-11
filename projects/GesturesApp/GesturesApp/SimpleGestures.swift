//
//  SimpleGestures.swift
//  GesturesApp
//
//  Created by Emil Atanasov on 01/09/24.
//

import SwiftUI

struct SimpleGestures: View {
    var body: some View {
        Image(systemName: "car.fill")
//            .onTapGesture(count: 3) {
//                print("Tapped! x 3")
//            }
//            .onLongPressGesture(minimumDuration: 3) {
//                print("Long Press")
//            }
            .gesture(TapGesture(count: 1).onEnded({ _ in
                print("tapped!")
            }))
    }
}

#Preview {
    SimpleGestures()
}
