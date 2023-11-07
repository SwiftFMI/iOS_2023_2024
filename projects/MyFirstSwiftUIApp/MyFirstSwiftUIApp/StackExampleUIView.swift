//
//  StackExampleUIView.swift
//  MyFirstSwiftUIApp
//
//  Created by Emil Atanasov on 11/02/23.
//

import SwiftUI

struct StackExampleUIView: View {
    var body: some View {
        HStack {
            Text("Item 1")
            Text("Item 2")
            Text("Item 2")
        }
        
        HStack(spacing: 10) {
            Text("Item 1")
            Text("Item 2")
            Text("Item 2")
        }
    }
}

#Preview {
    StackExampleUIView()
}
