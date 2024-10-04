//
//  TappingView.swift
//  Gestures-SwiftUI
//
//  Created by Alex Fila on 03/10/24.
//

import SwiftUI

struct TappingView: View {

    @State private var color : Color = Color.primary
    @State private var isBig = false
    
    var tapGesture: some Gesture {
        TapGesture(count: 2)
            .onEnded {
                withAnimation {
                    color = Color.random()
                }
                isBig.toggle()
            }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Rectangle()
                .foregroundColor(color)
                .frame(width: 150, height: 250)
                .gesture(tapGesture)
                .scaleEffect(isBig ? 1.5 : 1)
            Spacer()
            Circle()
                .frame(width: 100, height: 100)
                .foregroundColor(color)
                .scaleEffect(isBig ? 1.5 : 1)
                .onTapGesture {
                    color = Color.random()
                }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.top)
        .overlay(alignment: .top) {
            Text("Tap on circle, double tap on rectangle")
                .padding()
        }
        .navigationTitle("Tapping")
        .toolbar {
            Button("Again") {
                color = Color.primary
            }
        }
    }
}

#Preview { TappingView() }

extension Color {
    static func random() -> Color {
        return Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
    }
}
