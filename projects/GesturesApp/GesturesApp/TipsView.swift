//
//  TipsView.swift
//  GesturesApp
//
//  Created by Emil Atanasov on 01/09/24.
//

import SwiftUI
import TipKit

struct MyTip: Tip {
    var title: Text {
        Text("Title")
    }
    
    var message: Text? {
        Text("This is the message")
    }
    
    var image: Image? {
        Image(systemName: "house.and.flag.fill")
    }
}

struct TipsView: View {
    var body: some View {
        VStack {
//            TipView(MyTip())
            Text("Hello, World!")
                .popoverTip(MyTip())
        }
        .task {
            try? Tips.configure()
        }
    }
    
}

#Preview {
    TipsView()
}
