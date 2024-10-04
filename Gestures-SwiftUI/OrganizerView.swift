//
//  OrganizerView.swift
//  Gestures-SwiftUI
//
//  Created by Alex Fila on 01/10/24.
//

import SwiftUI

struct OrganizerView: View {
    
    enum NavigationOption {
        case tapping, longPress, drag, angle, linedraw, doubletap
    }
    
    @State private var selection: NavigationOption?
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selection) {
                OrganizerRow(title: "Tapping", description: "Tap on circle, double tap on rectangle", systemImage: "hand.point.right")
                    .tag(NavigationOption.tapping)
                OrganizerRow(title: "Touch and Hold", description: "Touch and hold a shape to interact.", systemImage: "hand.tap")
                    .tag(NavigationOption.longPress)
                OrganizerRow(title: "Drag", description: "Drag a shape using one finger.", systemImage: "arrow.up.and.down.and.arrow.left.and.right")
                    .tag(NavigationOption.drag)
                OrganizerRow(title: "Angle Change", description: "Change the angel of the shape with 2 fingers", systemImage: "arrow.trianglehead.rectanglepath")
                    .tag(NavigationOption.angle)
                OrganizerRow(title: "Line Draw", description: "To make a line, you need to touch and drag", systemImage: "paintbrush")
                    .tag(NavigationOption.linedraw)
                OrganizerRow(title: "Double Tap", description: "Double tap to see animation.", systemImage: "2.brakesignal")
                    .tag(NavigationOption.doubletap)
            }
            .navigationTitle("Gestures")
            
        } detail: {
            
            if let selection {
                switch selection {
                case .tapping: TappingView()
                case .longPress: LongPressView()
                case .drag: DragView()
                case .angle: AngleView()
                case .linedraw: LineDraw()
                case .doubletap: DoubleTap()
                }
            } else {
                Text("Another Gesture")
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview { OrganizerView() }
