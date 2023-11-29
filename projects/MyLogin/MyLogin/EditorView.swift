//
//  EditorView.swift
//  MyLogin
//
//  Created by Emil Atanasov on 11/21/23.
//

import SwiftUI

struct EditorView: View {
//    @Binding var innerButtonText: String
    @Bindable var data: MyData
    
    var body: some View {
        VStack {
            Text("Editor")
            Button {
//                innerButtonText += "!"
                data.name += "!"
            } label: {
                Text(data.name)
            }
            InnerEditorView()
        }
    }
}

//#Preview {
//    EditorView()
//}
