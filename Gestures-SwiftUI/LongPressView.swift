//
//  LongPressView.swift
//  Gestures-SwiftUI
//
//  Created by Alex Fila on 03/10/24.
//

import SwiftUI

struct LongPressView: View {
    @State private var sizeIndex = 0
    @GestureState var isDetectingLongPress = false
    
    private var sizes: [CGSize] = [
        CGSize(width: 150, height: 80),
        CGSize(width: 200, height: 40),
        CGSize(width: 50, height: 250),
        CGSize(width: 220, height: 100),
        CGSize(width: 90, height: 90),
    ]
    
    var longPressGesture: some Gesture {
        LongPressGesture()
            .onEnded { value in
                withAnimation {
                    sizeIndex += 1
                    if sizeIndex == sizes.count {
                        sizeIndex = 0
                    }
                }
            }
            .updating($isDetectingLongPress) { currentState, gestureState, transaction in
                gestureState = currentState
            }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Capsule()
                .foregroundColor(.yellow)
                .frame(width: sizes[sizeIndex].width, height: sizes[sizeIndex].height)
                .gesture(longPressGesture)
                .shadow(color: .shadowColor, radius: isDetectingLongPress ? 20 : 0)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.purple)
                .frame(width: sizes[sizeIndex].height, height: sizes[sizeIndex].width)
                .onLongPressGesture {
                    withAnimation {
                        sizeIndex += 1
                        if sizeIndex == sizes.count {
                            sizeIndex = 0
                        }
                    }
                }
            
            Spacer()
        }
        .navigationTitle("Touch and Hold")
        .frame(maxWidth: .infinity)
        .overlay(alignment: .top) {
            Text("Touch and hold the capsule to change its size")
                .padding()
        }
        .padding(.trailing)
        .toolbar {
            Button("Reset") {
                sizeIndex = 0
            }
        }
    }
}

#Preview { LongPressView() }


extension Color {
    static let shadowColor = Color("shadowColor")

}
