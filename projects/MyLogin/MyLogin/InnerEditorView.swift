//
//  InnerEditorView.swift
//  MyLogin
//
//  Created by Emil Atanasov on 11/21/23.
//

import SwiftUI

struct InnerEditorView: View {
    
    @EnvironmentObject var storageOld: StorageOld
    @Environment(Storage.self) var storage
    
    var body: some View {
        VStack {
            
            HStack {
                Text("EnvironmentObjet >")
                Text(storageOld.name)
                Button {
                    storageOld.name += "!"
                } label: {
                    Text("Edit")
                }
                
                
            }
            
            HStack {
                Text(storage.name)
                Button {
                    storage.name += "?"
                } label: {
                    Text("Edit")
                }
                
                
            }
        }
    }
}

#Preview {
    InnerEditorView()
}
