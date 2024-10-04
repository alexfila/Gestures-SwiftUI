//
//  AngleView.swift
//  Gestures-SwiftUI
//
//  Created by Alex Fila on 03/10/24.
//

import SwiftUI

struct AngleView: View {
    @State private var newAngle = Angle.zero
    
    var rotateIt: some Gesture {
        RotationGesture()
            .onChanged{ angle in
                newAngle = angle
            }
            .onEnded { angle in
                newAngle = angle
            }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("Current angle is" + "\(newAngle.degrees)")
                .font(.system(.body, design: .monospaced))
            Rectangle()
                .foregroundColor(.red)
                .frame(width: 225, height: 225)
                .rotationEffect(newAngle)
                .gesture(rotateIt)
            Spacer()
        }
        .navigationTitle("Angle Change")
        .frame(maxWidth: .infinity)
        .overlay(alignment: .top) {
            Text("You need to user 2 fingers to rotate it")
                .padding()
        }
        .padding()
        .toolbar {
            Button("Again") {
                newAngle = .zero
            }
        }
    }
}

#Preview { AngleView() }
