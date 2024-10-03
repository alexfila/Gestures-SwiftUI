//
//  DoubleTap.swift
//  Gestures-SwiftUI
//
//  Created by Alex Fila on 03/10/24.
//

import SwiftUI

struct DoubleTap: View {
    
    @State private var isOff = true
    
    let oneTap = TapGesture()
    let twoTaps = TapGesture(count: 2)
    let longPressGesture = LongPressGesture(minimumDuration: 2)
    let dragGesture = DragGesture(minimumDistance: 10)
    let rotationGesture = RotationGesture(minimumAngleDelta: Angle(degrees: 30))
    
    var sequence : some Gesture {
        SequenceGesture(oneTap, twoTaps)
            .onEnded { _ in
                withAnimation {
                    isOff.toggle()
                }
            }
    }
    
    var simultaneousGesture : some Gesture {
        SimultaneousGesture(oneTap, rotationGesture)
            .onEnded { _ in
                withAnimation {
                    isOff.toggle()
                }
            }
    }
    
    var body: some View {
        VStack {
            Text("Double tap to see animation")
            
            Spacer()
            
            RadialGradient(colors: [.green, .yellow, .mint], center: .center, startRadius: 0, endRadius: 250)
                .frame(maxHeight: 500)
                .overlay {
                    HStack {
                        RoundedRectangle(cornerRadius: 20)
                            .offset(x: isOff ? 0 : -120, y: 0)
                            .fill(LinearGradient(colors: [.black, .black, .yellow], startPoint: .bottomLeading, endPoint: .bottomTrailing))
                        RoundedRectangle(cornerRadius: 20)
                            .offset(x: isOff ? 0 : 120, y: 0)
                            .fill(LinearGradient(colors: [.black, .black, .yellow], startPoint: .bottomTrailing, endPoint: .bottomLeading))
                    }
                }
                .gesture(sequence)
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview { DoubleTap() }
