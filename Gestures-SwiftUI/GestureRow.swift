//
//  GestureRow.swift
//  Gestures-SwiftUI
//
//  Created by Alex Fila on 03/10/24.
//

import SwiftUI

struct GestureRow: View {
    let title: String
    let description: String
    let systemImage: String
    
    
    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .frame(width: 30)
                .font(.title)
                .foregroundColor(.accentColor)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(description)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

#Preview { GestureRow(title: "Drag", description: "Drag a shape using one finger", systemImage: "arrow.up.and.down.and.arrow.left.and.right") }
