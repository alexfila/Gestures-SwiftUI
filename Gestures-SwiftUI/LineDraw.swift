//
//  LineDraw.swift
//  Gestures-SwiftUI
//
//  Created by Alex Fila on 03/10/24.
//

import SwiftUI

struct LineDraw: View {
    @State private var pathElement = Path()
    @State var startPoint = CGPoint.zero
    @State var endPoint = CGPoint.zero

    var lineDrawingGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                startPoint = value.startLocation
                endPoint = value.location
                pathElement.move(to: value.startLocation)
            }
            .onEnded { value in
                endPoint = value.location
                pathElement.addLine(to: value.location)
            }
    }
    
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: startPoint)
                path.addLine(to: endPoint)
            }
            .stroke(Color.purple,
                    style: StrokeStyle(
                        lineWidth: 5,
                        lineCap: .round,
                        lineJoin: .miter,
                        miterLimit: 0,
                        dash: [5, 10],
                        dashPhase: 0
                    ))
            .contentShape(Circle())
            .opacity(0.5)
            
            pathElement
                .stroke(Color.purple,
                        style: StrokeStyle(
                            lineWidth: 7,
                            lineCap: .round,
                            lineJoin: .miter,
                            miterLimit: 0,
                            dash: [5, 10],
                            dashPhase: 0
                        ))
                .contentShape(Capsule())
        }
        .gesture(lineDrawingGesture)
        .navigationTitle("Draw a line")
        .overlay(alignment: .center) {
            Text("To make a line, you need to touch and drag")
                .padding()
        }
        .padding()
        .toolbar {
            Button("Again") {
                startPoint = .zero
                endPoint = .zero
                pathElement = Path()
            }
        }
    }
}

#Preview  { LineDraw() }
