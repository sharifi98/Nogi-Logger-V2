//
//  EditNotesView.swift
//  Nogi Logger
//
//  Created by Hossein Sharifi on 09/12/2023.
//

import SwiftUI

struct EditNotesView: View {
    
    @Binding var notes: String
    
    var body: some View {
        NavigationStack {
            TextEditor(text: $notes)
        }
        
    }
    
}

#Preview {
    EditNotesView(notes: .constant("Hello this is my notes"))
}
