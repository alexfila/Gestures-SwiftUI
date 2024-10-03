//
//  DoubleTap.swift
//  Gestures-SwiftUI
//
//  Created by Alex Fila on 03/10/24.
//

import SwiftUI

struct DoubleTap: View {
    
    @State private var isClosed = true
    
    let singleTapGesture = TapGesture()
    let doubleTapGesture = TapGesture(count: 2)
    let longPressGesture = LongPressGesture(minimumDuration: 2)
    let dragGesture = DragGesture(minimumDistance: 10)
    let rotationGesture = RotationGesture(minimumAngleDelta: Angle(degrees: 30))
    
    var sequenceGesture : some Gesture {
        SequenceGesture(singleTapGesture, doubleTapGesture)
            .onEnded { _ in
                withAnimation {
                    isClosed.toggle()
                }
            }
    }
    
    var simultaneousGesture : some Gesture {
        SimultaneousGesture(singleTapGesture, rotationGesture)
            .onEnded { _ in
                withAnimation {
                    isClosed.toggle()
                }
            }
    }
    
    var body: some View {
        VStack {
            Text("Use your composed gesture to trigger an animation")
            
            Spacer()
            
            
            LinearGradient(colors: [.mint, .teal, .orange], startPoint: .top, endPoint: .bottom)
                .frame(maxHeight: 500)
                .overlay {
                    HStack {
                        Rectangle()
                            .offset(x: isClosed ? 0 : -250, y: 0)
                        Rectangle()
                            .offset(x: isClosed ? 0 : 250, y: 0)
                    }
                }
                .gesture(sequenceGesture)
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview { DoubleTap() }
