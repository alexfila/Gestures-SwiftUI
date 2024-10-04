//
//  LongPressView.swift
//  Gestures-SwiftUI
//
//  Created by Alex Fila on 03/10/24.
//

import SwiftUI

struct LongPressView: View {
    @State private var sizeCounter = 0
    @GestureState var isPressingLong = false
    
    private var sizes: [CGSize] = [
        CGSize(width: 167, height: 75),
        CGSize(width: 190, height: 50),
        CGSize(width: 65, height: 234),
        CGSize(width: 214, height: 95),
        CGSize(width: 95, height: 95),
    ]
    
    var longPressGesture: some Gesture {
        LongPressGesture()
            .onEnded { value in
                withAnimation {
                    sizeCounter += 1
                    if sizeCounter == sizes.count {
                        sizeCounter = 0
                    }
                }
            }
            .updating($isPressingLong) { currentState, gestureState, transaction in
                gestureState = currentState
            }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Capsule()
                .foregroundColor(.yellow)
                .frame(width: sizes[sizeCounter].width, height: sizes[sizeCounter].height)
                .gesture(longPressGesture)
                .shadow(color: .yellow, radius: isPressingLong ? 20 : 5)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.purple)
                .frame(width: sizes[sizeCounter].height, height: sizes[sizeCounter].width)
                .shadow(color: .purple, radius: isPressingLong ? 20 : 5)
                .onLongPressGesture {
                    withAnimation {
                        sizeCounter += 1
                        if sizeCounter == sizes.count {
                            sizeCounter = 0
                        }
                    }
                }
            
            Spacer()
        }
        .navigationTitle("Long Press")
        .frame(maxWidth: .infinity)
        .overlay(alignment: .top) {
            Text("Press on any object and hold it")
                .padding()
        }
        .padding(.trailing)
        .toolbar {
            Button("Again") {
                sizeCounter = 0
            }
        }
    }
}

#Preview { LongPressView() }


extension Color {
    static let shadowColor = Color("shadowColor")
}
