//
//  ContentView.swift
//  CursoiOSLuciano
//
//  Created by Luciano de la Iglesia on 01/02/2025.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
        ZStack{
            Rectangle().foregroundStyle(.red)
            WholeThing()
        }
    }
}

struct FirstLastRectangles: View {
    var body: some View {
        HStack{
            Rectangle().foregroundStyle(.blue)
            Rectangle().foregroundStyle(.orange)
            Rectangle().foregroundStyle(.yellow)
        }
    }
}

struct OrangeRectangle: View {
    var body: some View {
        VStack{
            Rectangle().foregroundStyle(.orange)
        }
    }
}

struct CirclesWithRectangle: View {
    var body: some View {
        HStack{
            Circle().foregroundStyle(.green)
            Rectangle().foregroundStyle(.black).frame(width: 120, height: 300)
            Circle().foregroundStyle(.indigo)
        }
    }
}

struct WholeThing: View {
    var body: some View {
        VStack{
            FirstLastRectangles()
            OrangeRectangle()
            CirclesWithRectangle()
            OrangeRectangle()
            FirstLastRectangles()
        }
    }
}

#Preview {
    Exercise1()
}
