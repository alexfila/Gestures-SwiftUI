//
//  SingleLine.swift
//  Gestures-SwiftUI
//
//  Created by Alex Fila on 03/10/24.
//

import SwiftUI

struct SingleLine: View {
    @State private var drawing = Path()
    @State var lineStart = CGPoint.zero
    @State var lineEnd = CGPoint.zero

    var lineDrawingGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                lineStart = value.startLocation
                lineEnd = value.location
                drawing.move(to: value.startLocation)
            }
            .onEnded { value in
                lineEnd = value.location
                drawing.addLine(to: value.location)
            }
    }
    
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: lineStart)
                path.addLine(to: lineEnd)
            }
            .stroke(Color.accentColor, lineWidth: 8.0)
            .contentShape(Rectangle())
            .opacity(0.5)
            
            drawing
                .stroke(Color.accentColor, lineWidth: 8.0)
                .contentShape(Rectangle())
        }
        .gesture(lineDrawingGesture)
        .navigationTitle("Line Drawing")
        .overlay(alignment: .top) {
            Text("Touch and drag to make a line")
                .padding()
        }
        .padding()
        .toolbar {
            Button("Reset") {
                lineStart = .zero
                lineEnd = .zero
                drawing = Path()
            }
        }
    }
}

#Preview  { SingleLine() }
